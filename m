Received: from [217.116.0.27] (helo=correo9.acens.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaquinduran@adtelecom.es>) id 1Ja4UW-0004q4-60
	for openembedded-devel@openembedded.org; Fri, 14 Mar 2008 08:38:15 +0100
Received: (qmail 10547 invoked from network); 14 Mar 2008 07:35:55 -0000
Received: from unknown (HELO [192.168.0.37])
	(joaquinduran.adtelecom.es@[88.18.104.90])
	(envelope-sender <joaquinduran@adtelecom.es>)
	by correo9.acens.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	14 Mar 2008 07:35:55 -0000
Message-ID: <47DA38DF.6020307@adtelecom.es>
Date: Fri, 14 Mar 2008 09:35:43 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
Organization: AD Telecom
User-Agent: Thunderbird 2.0.0.12 (X11/20080229)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <19c1b8a90803132350x14a3496en8e921fae09cf9aff@mail.gmail.com>
In-Reply-To: <19c1b8a90803132350x14a3496en8e921fae09cf9aff@mail.gmail.com>
X-SA-Exim-Connect-IP: 217.116.0.27
X-SA-Exim-Mail-From: joaquinduran@adtelecom.es
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=RCVD_IN_DNSWL_MED,RDNS_NONE
	autolearn=ham version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gnome-vfs-2.20.0 needs glib-2.0-2.14.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2008 07:38:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

En/na Khem Raj ha escrit:
> Hi
> 
> I stumbled upon this while compiling x11-image using
> angstrom-2008-1.conf that gnome-vfs does not build because it needs
> headers from glibc-2.0-2.14.x but in
> ngstrom-2008-preferred-versions.inc we override this
> PREFERRED_VERSION_glib-2.0 = "2.15.6"
> 
> Should be still stick to 2.14.4 ?
> 
> Thanks
> 
> -Khem
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 

Hello,

glib 2.15.x are development series. I think that 2.16.x series are out. 
The last one is 2.16.1.

Joaquim Duran


