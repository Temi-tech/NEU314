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
    return (red, blue, green)
end

pixels("el-capitan.png")
red #confirm red
blue #confirm blue
green #confirm green


###########################################################################
###########################################################################


#1.A.e
#Make a new 360x640x3 matrix; let’s call this image2.
#https://docs.julialang.org/en/v1/base/arrays/#Core.AbstractArray
image2 = Array{Float32,2}(undef, 360, 640)


#Set image2[:,:,1] to be the G channel from the original image,
#image2[:,:,2] to be the B channel from the original image, and
#image2[:,:,3] to be the R channel from the original image.

#https://stackoverflow.com/questions/25561390/declare-and-initialise-3-dimensional-array
image2 = zeros(360,640,3) #add "0" to all slots in image2 array
image2[:,:,1] = green #set matrix 1 to correspond to G from original image
image2[:,:,2] = blue #set matrix 2 to correspond to B from original image
image2[:,:,3] = red #set matrix 3 to correspond to R from original image

#Use imshow() to display the original image and image2 side by side (hint: use
#subplot(1,2,1) to first make a left-hand axis and work with that; and
#then subplot(1,2,2) to make a right-hand axis, and work with that).
#The commands figure(figsize=[x,y]), title("your text goes
#here"), and axis("off") can be used to initialize a figure specified by
#x and y (width and height in inches), add a title, and turn off the axis,
#respectively, for aesthetics. Commit and push both the code and image
#to your repo.
figure(figsize=[12,8]), (subplot(1,2,1); #specify dimensions
imshow(picture); #show original picture in one subplot
axis("off"); title("Image 1")); (subplot(1,2,2);
imshow(image2); ; axis("off"); title("Image 2")); #show modified picture in other subplot

###########################################################################
###########################################################################

#1.B
#Write a function that, for given an image, circularly moves only one channel,
#the red channel (remember, this is the first one) up some number of pixels,
#p, such that the top p rows now become the bottom p rows. Your function should
#take two arguments -- 1) your image and 2) the number of pixels you want to
#shift it by -- and return the shifted image. Display both the original image
#channel and the result of circularly moving the red channel up by 180 pixels.

"""
circ_rotation -- Moves red channel of an image up by number of pixels p
Function takes an image name and number of
pixels you want to shift by as an argument and outputs the shifted
image.

Args:
    img (AbstractString): Take in file name of the image as string
    p (int): Take in number of pixels to shift red channels by
Returns:
    return ((subplot(2,2,1); imshow(imgorig);; axis("off")), (subplot(2,2,2); imshow(img); axis("off")))
     returns original image and image with red channel circularly shifted by p
"""
function circ_rotation(img::AbstractString, p)
    img = imread(img)
    imgorig = copy(img)
    red = imgorig[:,:,1]
    red2 = circshift(red, p)
    img[:,:,1] = red2
    return ((subplot(2,2,1); imshow(imgorig);; axis("off")), (subplot(2,2,2); imshow(img); axis("off"))) #pull from function to rest of code use semicolon in REPL
end

circ_rotation("el-capitan.png", 180)
