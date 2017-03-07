
		
		
		//DO NOT USE THIS PATHFINDER.  USE THE MAP CLASS INSTEAD.  KEEPING HERE FOR POSTERITY.
		//Pathfinder generates an array of squares connectiong a beginning and ending square.
		//Handles walls like shit.
		
		public function PathFinder(begin:String, end:String, steps:uint)
		{
			var beginLetter:String;
			var tmp:String;
			var beginNumber:uint
			var endLetter:String;
			var endNumber:uint;
			var tmp2:String;
			var directions:String;
			var i; var j;
			var currentL:uint;
			var currentN:uint;
			var currentSpot:String;
			var path:Array = new Array();
			var checker:SquareCheck = new SquareCheck();
			var heading:String;
			var wall:Boolean = false;
			
			
			beginLetter = begin.charAt(0);
			beginNumber = uint(begin.substr(1,2));
			
			endLetter = end.charAt(0);
			endNumber = uint(end.substr(1,2));
			
			
			currentL = mbutlerString.ToUnicodeNum(beginLetter);
			currentN = beginNumber;
			currentSpot = begin;
			path.push(currentSpot);
			
			
			for (i = 1; i <= steps; i++)
			{
				
				heading = Cardinal(currentSpot, end);
				
				
				
				
				switch (heading)
				{
					case "north":
					currentSpot = LookAhead("north",currentSpot);
					path.push(currentSpot);
					currentL = mbutlerString.ToUnicodeNum((currentSpot.charAt(0)));
					currentN = uint(currentSpot.substr(1,2));
					
					if (path[path.length-3] == currentSpot)
					{
						path.pop(); path.pop(); path.pop();
						heading = "west";
						currentSpot = path[path.length-1];
						
						OuterLoop: for (j = 1; j < 25; j++)
						{
							if (checker.IsLand(String.fromCharCode(currentL-1)+currentN) == true && checker.IsLand(String.fromCharCode(currentL)+(currentN-1)) !== true)
							{
								//if (checker.IsLand(String.fromCharCode(currentL-1)+currentN) !== true)
								//{
									currentL = mbutlerString.ToUnicodeNum((currentSpot.charAt(0)));
									currentN = uint(currentSpot.substr(1,2));
									currentSpot = (String.fromCharCode(currentL)+(currentN-1));
									path.push(currentSpot);						
								//}
								
								
							} else if (checker.IsLand(String.fromCharCode(currentL-1)+currentN) !== true)
							{
								break OuterLoop;
							}
						}
						
						
																					
					}
					
					
					
					heading = Cardinal(currentSpot, end);
					break;
					
					case "northeast":
					currentSpot = LookAhead("northeast",currentSpot);
					path.push(currentSpot);
					currentL = mbutlerString.ToUnicodeNum((currentSpot.charAt(0)));
					currentN = uint(currentSpot.substr(1,2));
					heading = Cardinal(currentSpot, end);
					break;
					
					case "east":
					currentSpot = LookAhead("east",currentSpot);
					path.push(currentSpot);
					currentL = mbutlerString.ToUnicodeNum((currentSpot.charAt(0)));
					currentN = uint(currentSpot.substr(1,2));
					heading = Cardinal(currentSpot, end);
					break;
					
					case "southeast":
					currentSpot = LookAhead("southeast",currentSpot);
					path.push(currentSpot);
					currentL = mbutlerString.ToUnicodeNum((currentSpot.charAt(0)));
					currentN = uint(currentSpot.substr(1,2));
					heading = Cardinal(currentSpot, end);
					break;
					
					case "south":
					currentSpot = LookAhead("south",currentSpot);
					path.push(currentSpot);
					currentL = mbutlerString.ToUnicodeNum((currentSpot.charAt(0)));
					currentN = uint(currentSpot.substr(1,2));
					heading = Cardinal(currentSpot, end);
					break;
					
					case "southwest":
					currentSpot = LookAhead("southwest",currentSpot);
					path.push(currentSpot);
					currentL = mbutlerString.ToUnicodeNum((currentSpot.charAt(0)));
					currentN = uint(currentSpot.substr(1,2));
					heading = Cardinal(currentSpot, end);
					break;
					
					case "west":
					currentSpot = LookAhead("west",currentSpot);
					path.push(currentSpot);
					
					currentL = mbutlerString.ToUnicodeNum((currentSpot.charAt(0)));
					currentN = uint(currentSpot.substr(1,2));
					heading = Cardinal(currentSpot, end);
					break;
					
					case "northwest":
					currentSpot = LookAhead("northwest",currentSpot);
					path.push(currentSpot);
					
					currentL = mbutlerString.ToUnicodeNum((currentSpot.charAt(0)));
					currentN = uint(currentSpot.substr(1,2));
					heading = Cardinal(currentSpot, end);
					break;		
									
				}
				
									
				if (currentSpot == end)
				{
					return path;
				}
								
			}
			
			
			return path;
					
			
		}
		
		/*
		LookAhead checks the next square in its path based on the current heading.  If the next square is not land then it advances in the same direction.
		If the next square IS land it tries squares in this order until it finds an unoccupied square: forward left, forward right, left, right.  
		The function returns the best square to advance to.  
		*/
		
		public function LookAhead(heading:String, square:String)
		{
			var checker:SquareCheck = new SquareCheck();
			var currentL:uint;
			var currentN:uint;
			currentL = mbutlerString.ToUnicodeNum(square.charAt(0));
			currentN = uint(square.substr(1,2));
			
			switch (heading)
			{
				case "north":
					if (checker.IsLand(String.fromCharCode(currentL-1)+currentN) !== true) //north
					{
						 return String.fromCharCode(currentL-1)+(currentN);
												
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN+1)) !== true) //northeast
					{
						return String.fromCharCode(currentL-1)+(currentN+1);
						  
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN-1)) !== true) //northwest
					{
						return String.fromCharCode(currentL-1)+(currentN-1);
							
					} else if (checker.IsLand(String.fromCharCode(currentL)+(currentN+1)) !== true) //east
					{
						return String.fromCharCode(currentL)+(currentN+1);
						
					} else if (checker.IsLand(String.fromCharCode(currentL)+(currentN-1)) !== true) //west
					{
						return String.fromCharCode(currentL)+(currentN-1);
					}
					
				case "northeast":
					if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN+1)) !== true) //northeast
					{
						 return String.fromCharCode(currentL-1)+(currentN+1);
												
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+currentN) !== true) //north
					{
						 return String.fromCharCode(currentL-1)+(currentN);
						  
					} else if (checker.IsLand(String.fromCharCode(currentL)+(currentN+1)) !== true) //east
					{
						return String.fromCharCode(currentL)+(currentN+1);
							
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN-1)) !== true) //northwest
					{
						return String.fromCharCode(currentL-1)+(currentN-1);
						
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN+1)) !== true)  //southeast
					{
						return String.fromCharCode(currentL+1)+(currentN+1);
					}
					
				case "east":
					if (checker.IsLand(String.fromCharCode(currentL)+(currentN+1)) !== true) //east
					{
						return String.fromCharCode(currentL)+(currentN+1);
												
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN+1)) !== true) //northeast
					{
						 return String.fromCharCode(currentL-1)+(currentN+1);
						  
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN+1)) !== true)  //southeast
					{
						return String.fromCharCode(currentL+1)+(currentN+1);
							
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+currentN) !== true) //north
					{
						 return String.fromCharCode(currentL-1)+(currentN);
						
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN)) !== true)  //south
					{
						return String.fromCharCode(currentL+1)+(currentN);
					}
					
				case "southeast":
					if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN+1)) !== true)  //southeast
					{
						return String.fromCharCode(currentL+1)+(currentN+1);
												
					} else if (checker.IsLand(String.fromCharCode(currentL)+(currentN+1)) !== true) //east
					{
						return String.fromCharCode(currentL)+(currentN+1);
						  
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN)) !== true)  //south
					{
						return String.fromCharCode(currentL+1)+(currentN);
							
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN+1)) !== true) //northeast
					{
						 return String.fromCharCode(currentL-1)+(currentN+1);
						
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN-1)) !== true)  //southwest
					{
						return String.fromCharCode(currentL+1)+(currentN-1);
					}
					
				case "south":
					if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN)) !== true)  //south
					{
						return String.fromCharCode(currentL+1)+(currentN);
												
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN+1)) !== true)  //southeast
					{
						return String.fromCharCode(currentL+1)+(currentN+1);
						  
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN-1)) !== true)  //southwest
					{
						return String.fromCharCode(currentL+1)+(currentN-1);
							
					} else if (checker.IsLand(String.fromCharCode(currentL)+(currentN+1)) !== true) //east
					{
						return String.fromCharCode(currentL)+(currentN+1);
						
					} else if (checker.IsLand(String.fromCharCode(currentL)+(currentN-1)) !== true)  //west
					{
						return String.fromCharCode(currentL)+(currentN-1);
					}
					
				case "southwest":
					if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN-1)) !== true)  //southwest
					{
						return String.fromCharCode(currentL+1)+(currentN-1);
												
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN)) !== true)  //south
					{
						return String.fromCharCode(currentL+1)+(currentN);
						  
					} else if (checker.IsLand(String.fromCharCode(currentL)+(currentN-1)) !== true)  //west
					{
						return String.fromCharCode(currentL)+(currentN-1);
							
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN+1)) !== true)  //southeast
					{
						return String.fromCharCode(currentL+1)+(currentN+1);
						
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN-1)) !== true)  //northwest
					{
						return String.fromCharCode(currentL-1)+(currentN-1);
					}
					
				case "west":
					if (checker.IsLand(String.fromCharCode(currentL)+(currentN-1)) !== true)  //west
					{
						return String.fromCharCode(currentL)+(currentN-1);
												
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN-1)) !== true)  //southwest
					{
						return String.fromCharCode(currentL+1)+(currentN-1);
						  
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN-1)) !== true)  //northwest
					{
						return String.fromCharCode(currentL-1)+(currentN-1);
							
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN)) !== true)  //south
					{
						return String.fromCharCode(currentL+1)+(currentN);
						
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+currentN) !== true) //north
					{
						 return String.fromCharCode(currentL-1)+(currentN);
					}
					
				case "northwest":
					if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN-1)) !== true)  //northwest
					{
						return String.fromCharCode(currentL-1)+(currentN-1);
												
					} else if (checker.IsLand(String.fromCharCode(currentL)+(currentN-1)) !== true)  //west
					{
						return String.fromCharCode(currentL)+(currentN-1);
						  
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+currentN) !== true) //north
					{
						 return String.fromCharCode(currentL-1)+(currentN);
							
					} else if (checker.IsLand(String.fromCharCode(currentL+1)+(currentN-1)) !== true)  //southwest
					{
						return String.fromCharCode(currentL+1)+(currentN-1);
						
					} else if (checker.IsLand(String.fromCharCode(currentL-1)+(currentN+1)) !== true) //northeast
					{
						 return String.fromCharCode(currentL-1)+(currentN+1);
					}
			}
		}