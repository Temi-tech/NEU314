using PyPlot; pygui(true); using Printf

#1.A.a
#Use imread() to load it into Julia and imshow() to display it in a figure.
picture = imread("el-capitan.png")
imshow(picture)

#Use size() to see that the image is 360x640x4, in other words, it is a
#set of memory slots arranged as a rectangular prism.
size(picture)


###########################################################################


#1.A.b
#Write a function that takes as input a string representing the filename,
#and then loads the image file, displays it, and extracts the red, blue, and
#green channels into separate variables, and returns those variables. In
#other words, your function should take an image name as an argument
#and output three separate variables, that in the case of our example
#image would each be a 360x640 matrix. Commit and push your file to
#the repository you just set up.

#make variables which will be updated in the function and called later
red = 1
blue = 2
green = 3

"""
pixels -- Function takes an image name as an argument and outputs three separate variables
Takes as input a string representing the filename,then loads the image file,
displays it, and extracts the red, blue, and green channels into separate
variables, and returns those variables.

Args:
    imagename (AbstractString): Take in file name of the image as string
Returns:
    out (red, blue, green): returns values of red, blue, and green channels
"""

#add bug
function pixels(imagename::AbstractString)
    #https://docs.julialang.org/en/v1/manual/strings/
    image = imread(imagename)
    imshow(image)
    global red
    global blue
    global green
    red = image[:,:,1]
    blue = image[:,:,2]
    green = image[:,:,3]
    println("BUG BUG BUG")
    return (red, blue, green)
end

pixels("el-capitan.png")
red #confirm red
blue #confirm blue
green #confirm green


###########################################################################
