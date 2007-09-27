Received: from [217.116.0.112] (helo=correo12.acens.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <joaquinduran@adtelecom.es>) id 1Iauwe-0002zY-TT
	for openembedded-devel@openembedded.org; Thu, 27 Sep 2007 17:06:29 +0200
Received: (qmail 11986 invoked from network); 27 Sep 2007 15:01:51 -0000
Received: from unknown (HELO [194.179.62.51])
	(joaquinduran.adtelecom.es@[81.44.82.110])
	(envelope-sender <joaquinduran@adtelecom.es>)
	by correo12.acens.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	27 Sep 2007 15:01:51 -0000
Message-ID: <46FBD354.5080005@adtelecom.es>
Date: Thu, 27 Sep 2007 17:59:16 +0200
From: Joaquim Duran <joaquinduran@adtelecom.es>
Organization: AD Telecom
User-Agent: Thunderbird 2.0.0.6 (X11/20070806)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Xcursor transparent theme with kdrive 1.2 and kdrive 1.3
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
X-List-Received-Date: Thu, 27 Sep 2007 15:06:29 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hello all,

We've two colibri based embedded computers (pxa-270 processor). One runs
kdrive 1.2 and the second one, kdrive 1.3.0.0. To both machines I've
installed the package xcursor-transparent-theme.

After re-starting both kdrives, the X cursor were till visible in both
computers. As far I remember, some months ago, I installed the
xcursor-transparent-theme to another colibri and after reboot kdrive,
the cursor were transparent.

I've no clear if this is a bug of Kdrive (I'm assuming that people which
uses GPE should have seen this), or I've missed some steps.

Both versions of kdrive are the same of the repository with the
exception of the inclusion of patches from bug 3069 (screen in mode
800x480).

Any help will be appreciated.


Thanks and Best Regards,
Joaquim Duran


