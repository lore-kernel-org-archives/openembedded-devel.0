Received: from [213.4.149.66] (helo=ctsmtpout2.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GVlFH-0002Lq-6u
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Oct 2006 10:39:51 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout2.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4526113E0000123A for openembedded-devel@lists.openembedded.org;
	Fri, 6 Oct 2006 10:34:01 +0200
Message-ID: <452622B1.2070203@adtelecom.es>
Date: Fri, 06 Oct 2006 10:32:33 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Specify X11 include and libs directories
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
X-List-Received-Date: Fri, 06 Oct 2006 08:39:51 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,

I'm writting a .bb file for FLTK version 1.1.7. While executing the 
./configure script, I should specify the include and lib directories of 
X in the cross development.

I know how specify the parameter to ./configure script, but the problem 
is that I don't know how specify these directories using variables to be 
flexible and from which folder from BUILD dir.

How can I specify them? Any help will be appreciated.

Thanks and Best Regards,
Joaquim Duran


