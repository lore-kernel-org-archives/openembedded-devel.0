Received: from numa004.numadns.com ([50.57.168.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jms@bughunter.ca>) id 1UJqI6-0000Qg-O1
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Mar 2013 20:09:17 +0100
Received: from numa004.numadns.com-new (localhost [127.0.0.1])
	by numa004.numadns.com (Postfix) with SMTP id 48FD5183C3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Mar 2013 13:42:38 -0500 (CDT)
From: "Justin Seitz" <jms@bughunter.ca>
To: openembedded-devel@lists.openembedded.org
Message-Id: <1364150558.389@bughunter.ca>
X-Originating-IP: 71.17.133.11
X-Mailer: Usermin 1.540
Date: Sun, 24 Mar 2013 13:42:38 -0500 (CDT)
MIME-Version: 1.0
Subject: ATNGW100
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Sun, 24 Mar 2013 19:09:24 -0000
Content-Type: multipart/mixed; boundary="bound1364150558"

--bound1364150558
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hey all,

I am pretty new to OE, and having followed some scattered instructions on building the ATNGW100 I have been unsuccessful with the new OE core. My local.conf includes the directives:

TARGET_OS =3D =93linux-uclibc=94
MACHINE =3D =93atngw100&#8243;
DISTRO =3D =93angstrom-2008.1&#8243;
ANGSTROMLIBC =3D =93uclibc=94

Which it complains that angstrom-2008.1 cannot be found as a distro. Is this a case that I can just pull the configs from the OE-classic repo over or is there a guide somewhere that I can't find in YOCTO that describes how I can move the ATNGW100 build over to the new OE-core?

Thanks in advance,

JMS

--bound1364150558--
