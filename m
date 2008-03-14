Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ja3ma-0007sj-W1
	for openembedded-devel@openembedded.org; Fri, 14 Mar 2008 07:52:51 +0100
Received: by wa-out-1112.google.com with SMTP id v27so4502135wah.4
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 23:50:34 -0700 (PDT)
Received: by 10.114.153.18 with SMTP id a18mr11197648wae.127.1205477434166;
	Thu, 13 Mar 2008 23:50:34 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Thu, 13 Mar 2008 23:50:34 -0700 (PDT)
Message-ID: <19c1b8a90803132350x14a3496en8e921fae09cf9aff@mail.gmail.com>
Date: Thu, 13 Mar 2008 23:50:34 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.146.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gnome-vfs-2.20.0 needs glib-2.0-2.14.x
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
X-List-Received-Date: Fri, 14 Mar 2008 06:52:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

I stumbled upon this while compiling x11-image using
angstrom-2008-1.conf that gnome-vfs does not build because it needs
headers from glibc-2.0-2.14.x but in
ngstrom-2008-preferred-versions.inc we override this
PREFERRED_VERSION_glib-2.0 = "2.15.6"

Should be still stick to 2.14.4 ?

Thanks

-Khem


