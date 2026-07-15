# Lerp
[![Lerp](https://img.shields.io/powershellgallery/dt/Lerp)](https://www.powershellgallery.com/packages/Lerp/)
## 

Lerp is a simple single command module for Linear Interpolation.

It gives you a point between two other points.


## Installing and Importing

You can install Lerp from the [PowerShell gallery](https://powershellgallery.com/)

~~~PowerShell
Install-Module Lerp -Scope CurrentUser -Force
~~~

Once installed, you can import the module with:

~~~PowerShell
Import-Module Lerp -PassThru
~~~


You can also clone the repo and import the module locally:

~~~PowerShell
git clone https://github.com/PoshWeb/Lerp
cd ./Lerp
Import-Module ./ -PassThru
~~~

## Functions
Lerp has 2 functions
### Get-Lerp
#### Lerp!
Lerp performs linear interpolation in one, two, three, or four dimensions.

This calculates the point along a straight line between two points.
##### Parameters

|Name|Type|Description|
|-|-|-|
|Start|PSObject|The start point|
|End|PSObject|The end point|
|Amount|Single|The amount of lerp<br/>The percentage of change between two points|

##### Examples
###### Example 1
Lerp in 1D
~~~PowerShell
lerp 1 2 .5
~~~
###### Example 2
Lerp in 2D
~~~PowerShell
lerp 1,2 3,4 .5
~~~
###### Example 3
Lerp in 3D
~~~PowerShell
lerp 1,2,3 4,5,6 .5
~~~
###### Example 4
Lerp in 4D
~~~PowerShell
lerp 1,2,3,4 5,6,7,8 .5
~~~
### Lerp
#### Lerp!
Lerp performs linear interpolation in one, two, three, or four dimensions.

This calculates the point along a straight line between two points.
##### Parameters

|Name|Type|Description|
|-|-|-|
|Start|PSObject|The start point|
|End|PSObject|The end point|
|Amount|Single|The amount of lerp<br/>The percentage of change between two points|

##### Examples
###### Example 1
Lerp in 1D
~~~PowerShell
lerp 1 2 .5
~~~
###### Example 2
Lerp in 2D
~~~PowerShell
lerp 1,2 3,4 .5
~~~
###### Example 3
Lerp in 3D
~~~PowerShell
lerp 1,2,3 4,5,6 .5
~~~
###### Example 4
Lerp in 4D
~~~PowerShell
lerp 1,2,3,4 5,6,7,8 .5
~~~
