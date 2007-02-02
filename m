Received: from [59.160.240.225] (helo=rediffmail.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <suhas7860@rediffmail.com>) id 1HCthI-00063H-Pf
	for openembedded-devel@openembedded.org; Fri, 02 Feb 2007 09:23:05 +0100
Received: (qmail 3433 invoked by uid 510); 2 Feb 2007 08:20:09 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
Date: 2 Feb 2007 08:20:09 -0000
Message-ID: <20070202082009.3431.qmail@webmail103.rediffmail.com>
Received: from unknown (221.243.162.19) by rediffmail.com via HTTP;
	02 feb 2007 08:20:09 -0000
MIME-Version: 1.0
From: "Mr. Suhas Ghosh" <suhas7860@rediffmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-users@lists.openembedded.org
Subject: Conf File help
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
X-List-Received-Date: Fri, 02 Feb 2007 08:23:07 -0000
Content-Type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Hi All,
   I want to build kernal image for ARM926EJ-S.
   I have written conf file in build/conf, machine and distro.
   I specified my machine neme as "emm213".
   Inside machine and distro conf file name is emm113.conf
   But when I try to run "bitbake bootstrap-image" command
   it gives the following error.
   ERROR: Unable to open conf/bitbake.conf
   but my path setting is OK.
   I used=20
   export PATH=3D/stuff/bitbake/bin:$PATH
   export BBPATH=3D/stuff/build:/stuff/org.openembedded.dev

   When I am testing with 'bitbake nano' command it is running.
   Is it possible to give my own machine name?
   Hope to get help from you.
   Thanking you in advance.
                             with best regards
                                Suhas Ghosh  
  =20
    


From freyther@gmx.net Fri Feb 02 10:21:56 2007
Received: from [213.165.64.20] (helo
