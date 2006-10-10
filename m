Received: from [213.4.149.66] (helo=ctsmtpout3.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GXIl9-0001rZ-W9
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Oct 2006 16:39:08 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout3.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 45269CF300068280 for openembedded-devel@lists.openembedded.org;
	Tue, 10 Oct 2006 16:32:53 +0200
Message-ID: <452BBCC8.5090505@adtelecom.es>
Date: Tue, 10 Oct 2006 16:31:20 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Problem of configuration of X locale with Kdrive
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2006 14:39:08 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,

I don't know if this is an off-topic of this list, but I'll post.

I'm trying to start the Kdrive xserver (v. X11R7.1) with a window 
manager (twm), generated from xterminal image. 'xinit' is also 
installed, with fonts. Each time that I run 'startx' or 'xinit' the 
following message is shown by kdrive:

Warning: X locale modifiers not supported, using default
Warning: Unable to load any usable fontset
Error: Aborting: no fontset found

How can I set up this locale? Any help will be appreciated.


I've observed that if library hasn't any application depending on it, 
the bitbake doesn't include the library to the image. Is this a bug?

Thanks and Best Regards,
Joaquim Duran


