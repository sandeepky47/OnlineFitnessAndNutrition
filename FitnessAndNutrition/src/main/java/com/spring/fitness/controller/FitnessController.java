package com.spring.fitness.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fitness.model.Diet;
import com.spring.fitness.model.Exercise;
import com.spring.fitness.model.User;
import com.spring.fitness.repos.DietRepo;
import com.spring.fitness.repos.ExerciseRepo;
import com.spring.fitness.repos.UserRepo;


@Controller
public class FitnessController {

	@Autowired
	UserRepo userRepo;
	
	@Autowired
    ExerciseRepo exerciserepo;
	
	@Autowired
	DietRepo dietrepo;

	@GetMapping("/home")
	public String registerNewUser(ModelMap map, HttpServletRequest request) {
		return "home";
	}

	@PostMapping("/login")
	public String checkAndLogin(HttpServletRequest request, ModelMap map) 
	{		
			if (userRepo.userExist(request.getParameter("emailId"), request.getParameter("password")) >= 1)
			{
				request.getSession().setAttribute("userEmail", request.getParameter("emailId"));
				request.getSession().setAttribute("userName",
						userRepo.findUserByEmail(request.getParameter("emailId")).getFirstName());
				request.getSession().setAttribute("error", 0);
			
				return "redirect:/home";
			} 
			else
			{
				map.addAttribute("error", 1);
				return "/home";
			}
			
		}

	

	@GetMapping("/register")
	public String registration(User user, ModelMap map) {
		map.addAttribute("userAlready", 0);
		return "register";
	}

	@GetMapping("/userProfile")
	public String userProfile(ModelMap map, HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("userEmail");
		if (email.equals("no")) {
			return "redirect:/home";
		} else {
			User user = userRepo.findUserByEmail(email);
			map.addAttribute("user", user);
			return "UserProFile";
		}

	}

	@GetMapping("/updateInfo")
	public String updateInfo() {

		return "updateInfo";
	}

	@PostMapping("/updateData")
	public String updateData(HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("userEmail");
		User user = userRepo.findUserByEmail(email);
		if (!user.getFirstName().equals(request.getAttribute("firstName")))
			request.getSession().setAttribute("userName", request.getParameter("firstName"));
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setMobileNumber(request.getParameter("mobileNumber"));
		if (!user.getEmailId().equals(request.getParameter("emailId")))
			request.getSession().setAttribute("userEmail", request.getParameter("emailId"));
		user.setEmailId(request.getParameter("emailId"));
		userRepo.save(user);
		return "redirect:/userProfile";
	}

	@PostMapping("/changePassword")
	public String changePass(HttpServletRequest request) {
		String email = (String) request.getSession().getAttribute("userEmail");
		User user = userRepo.findUserByEmail(email);
		user.setPassword(request.getParameter("password"));
		userRepo.save(user);
		return "redirect:/userProfile";
	}

	@PostMapping("/submitData")
	public String submitUserData(User user, HttpServletRequest request, ModelMap map) {
		map.addAttribute("userAlready", 0);

		if (userRepo.userCount(user.getEmailId()) >= 1) {
			map.addAttribute("userAlready", 1);
			return "/register";
		}

		request.getSession().setAttribute("userLogin", false);
		userRepo.save(user);
		return "redirect:/home";
	}

	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().setAttribute("userEmail", "no");
		request.getSession().setAttribute("admin", 1);
		//admin=false;
		return "redirect:/home";
	}

	@GetMapping("/bmicalculate")
	public String bmiCalculator(ModelMap map, HttpServletRequest request) {
		
			return "bmicalculator";
		}
	
	@PostMapping("/bmiresult")
	public ModelAndView bmisbumit(HttpServletRequest request,HttpServletResponse response) {
	     DecimalFormat df = new DecimalFormat("0.000");
		float h=Float.parseFloat(request.getParameter("height"));  
		float w=Float.parseFloat(request.getParameter("weight"));
		 h=h/100;
		float res=w/(h*h);
		   float result=Float.parseFloat(df.format(res));
		 String category;
		    if(result<18.5)
		    {   category="Underweight";
		    }
		    else if(result>=18.5 && result<=25)
		         {category="Normal"; }
		    else{
		        category="Overweight";
		    }
		    
		String finalresult= "> BMI = " + String.valueOf(result) +" kg/m2    ("+category+" )";
		    
			
		ModelAndView mv=new ModelAndView();
		mv.setViewName("bmicalculator");
		 mv.addObject("fresult",finalresult);
		 mv.addObject("myresult",result);
		return mv;
		 
		}

	@GetMapping("/norm")
	public String shownormal(ModelMap map, HttpServletRequest request) {
		
		List<Diet> normcategory = dietrepo.findByCategory("normal");
		List<Exercise> exercise = exerciserepo.findByCategory("normal");
		
		normcategory.forEach(d->{map.addAttribute("lunchresult",d.getLunch());
		map.addAttribute("breakfastresult",d.getBreakfast());
		map.addAttribute("dinnerresult",d.getDinner());
		map.addAttribute("specialresult",d.getSpecial());     });
		
		exercise.forEach(exer->{map.addAttribute("walkresult",exer.getWalktime());
		map.addAttribute("runresult",exer.getRuntime());
		map.addAttribute("yogaresult",exer.getYoga());
		map.addAttribute("weightresult",exer.getWeighttraining());  
		map.addAttribute("swimresult",exer.getSwimtime()); 
		map.addAttribute("sportresult",exer.getSport());    });
		
		
			return "normal";
		}
	
	
	
	@GetMapping("/over")
	public String showoverweight(ModelMap map, HttpServletRequest request) {
		
		List<Diet> normcategory = dietrepo.findByCategory("overweight");
		List<Exercise> exercise = exerciserepo.findByCategory("overweight");
		
		normcategory.forEach(d->{map.addAttribute("lunchresult",d.getLunch());
		map.addAttribute("breakfastresult",d.getBreakfast());
		map.addAttribute("dinnerresult",d.getDinner());
		map.addAttribute("specialresult",d.getSpecial());     });
		
		exercise.forEach(exer->{map.addAttribute("walkresult",exer.getWalktime());
		map.addAttribute("runresult",exer.getRuntime());
		map.addAttribute("yogaresult",exer.getYoga());
		map.addAttribute("weightresult",exer.getWeighttraining());  
		map.addAttribute("swimresult",exer.getSwimtime()); 
		map.addAttribute("sportresult",exer.getSport());    });
		
			return "overweight";
		}
	
	@GetMapping("/under")
	public String showunderweight(ModelMap map, HttpServletRequest request) {
		
		List<Diet> normcategory = dietrepo.findByCategory("underweight");
		List<Exercise> exercise = exerciserepo.findByCategory("underweight");
		
		normcategory.forEach(d->{map.addAttribute("lunchresult",d.getLunch());
		map.addAttribute("breakfastresult",d.getBreakfast());
		map.addAttribute("dinnerresult",d.getDinner());
		map.addAttribute("specialresult",d.getSpecial());     });
		
		exercise.forEach(exer->{map.addAttribute("walkresult",exer.getWalktime());
		map.addAttribute("runresult",exer.getRuntime());
		map.addAttribute("yogaresult",exer.getYoga());
		map.addAttribute("weightresult",exer.getWeighttraining());  
		map.addAttribute("swimresult",exer.getSwimtime()); 
		map.addAttribute("sportresult",exer.getSport());    });
		
			return "underweight";
		}

	
}
