Credits
Nirelz



How to install
Simply place the sql folder inside the modules and head over to Http://yourwebsite.com/sql

ATTENTION!!!
If your world DB isnt running on REALM ID 1 
you must go in and change every getRealm(1) number inside each make model.

As mentioned these files are still in alpha and will be updated as i find and solve all bugs.
Its used on my own server for my Gms. If you wish to enable it to players. 

Simply go into the controllers and remove

"if(!$this->user->isGm())
		{
			redirect('error/rank');
			die();
		}" 

from the public function __contstuct()

Report all bugs to me over skype: Nirelz_cassiopeia or email: Nirelz1993@hotmail.com

Thank you.