Received: from [213.4.149.66] (helo=ctsmtpout1.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GSAAW-0006sH-5G
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 12:28:04 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout1.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4517ACDD0002D241 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 12:26:46 +0200
Message-ID: <45190D58.2020807@adtelecom.es>
Date: Tue, 26 Sep 2006 12:22:00 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: List of dependent packages
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
X-List-Received-Date: Tue, 26 Sep 2006 10:28:04 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,

Is there any way to know the set of packages to be included in an
image? Or more generally, how can I list the set of packages (with
recursion) that are needed for one specified package?

This should be done once processed the config file and updated the cache 
and before the compilation of packages.

Thanks and Best Regards,
Joaquim Duran



