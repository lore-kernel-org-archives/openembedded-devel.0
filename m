Received: from rs69.luxsci.com ([64.49.254.154])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchiii@mtiemail.com>) id 1QmWWy-0002rh-Jd
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 21:46:04 +0200
Received: from [192.168.0.165] (adsl-76-255-12-150.dsl.mrdnct.sbcglobal.net
	[76.255.12.150]) (authenticated bits=0)
	by rs69.luxsci.com (8.13.8/8.13.8) with ESMTP id p6SJfhPR029451
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 14:41:44 -0500
Message-ID: <4E31BB77.5000500@mtiemail.com>
Date: Thu, 28 Jul 2011 15:41:43 -0400
From: "George C. Huntington III" <gchiii@mtiemail.com>
Organization: MicroTools, Inc.
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110625 Remi/fc11 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
Subject: image level user manipulation
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
X-List-Received-Date: Thu, 28 Jul 2011 19:46:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

are there any classes or layers that let you create users on an image
for the 2011.03-maintenance branch?

i want to create some custom users and home directories.  I think I can
do it via the ROOTFS_POSTPROCESS_COMMAND, but it feels like there should
be a better way.  is there a way to run the addgroup and adduser tools
natively but in such a way that they work their magic on the root
filesystem being created?



