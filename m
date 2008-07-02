Received: from [217.116.0.34] (helo=correo2.acens.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaquimduran@adtelecom.es>) id 1KDxjy-0004Cr-OV
	for openembedded-devel@openembedded.org; Wed, 02 Jul 2008 10:31:02 +0200
Received: (qmail 14013 invoked from network); 2 Jul 2008 08:27:49 -0000
Received: from unknown (HELO [192.168.0.37])
	(joaquimduran.adtelecom.es@[83.32.134.48])
	(envelope-sender <joaquimduran@adtelecom.es>)
	by correo2.acens.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	2 Jul 2008 08:27:49 -0000
Message-ID: <486B3AF3.90906@adtelecom.es>
Date: Wed, 02 Jul 2008 10:23:15 +0200
From: Joaquim Duran <joaquimduran@adtelecom.es>
Organization: AD Telecom
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <486A524B.2080702@adtelecom.es>
In-Reply-To: <486A524B.2080702@adtelecom.es>
Subject: Re: Installation of a new locale in an installed image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jul 2008 08:31:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

En/na Joaquim Duran ha escrit:
> Dear all,
> 
> I know that to create an image with several locales, these locales 
> should be included in LINGUAS var. I'm interested in install a new 
> locale to an already installed image.
> 
> For this new locale to install, I've installed the corresponding 
> glibc-localedata- and glibc-locale- packages, but the locale could not 
> be used.
> 
> Perphaps I'm wrong, but I think that a glibc-binary-localedata should be 
> installed. Could you confirm it?
> 
> How can I generate these packages?
> 
> Thanks and Best Regards,
> Joaquim Duran
> 

Only rebuilding the glibc was enough.


