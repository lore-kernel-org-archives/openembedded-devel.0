Received: from [192.132.34.13] (helo=amail.unina.it)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <ranaldo@unina.it>) id 1GKaCH-0001Ng-3n
	for Openembedded-devel@openembedded.org; Tue, 05 Sep 2006 14:38:33 +0200
Received: from blaster.unina.it ([192.132.34.15]) (authenticated bits=0)
	by amail.unina.it (8.13.4/8.13.4) with ESMTP id k85CZkbR021008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 5 Sep 2006 14:35:46 +0200
From: Nicola Ranaldo <ranaldo@unina.it>
To: Openembedded-devel@openembedded.org
Date: Tue, 5 Sep 2006 14:35:42 +0200
User-Agent: KMail/1.9.4
MIME-Version: 1.0
Message-Id: <200609051435.42809.ranaldo@unina.it>
Subject: local.conf and DISTRO
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
X-List-Received-Date: Tue, 05 Sep 2006 12:38:33 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sorry if this is a repeated question, i googled and searched the wiki site and 
i did not found a good answer.
I want to setup an OE environment to develop familiar/opie applications and to 
build missing packages from the installation image.
The problem is that after a lot of manual patch (ld and libstdc++),  BBMASK 
and ASSUME_PROVIDED, i finally have packages, but they depends on newer libs.
So i have to update them on the device, mixing stable packages with unstable 
packages. When i tryied to compile the hello world application i found i 
needed a threaded qte, missing from the 0.8.4, so i mixed them too.
I was not able to compile the last kernel, as it seems not patched for h2200.
It's easy to make the system highly unstable.
So i'd like to edit my local.conf to build an opie-image from sources used for 
0.8.4 release and not from cvs.
May you help me?

	Niko


