Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1ROGnQ-0004ip-NQ for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 23:39:04 +0100
Received: by wyh5 with SMTP id 5so2293253wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 14:32:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.107.229 with SMTP id hf5mr5119593wib.35.1320877968985;
	Wed, 09 Nov 2011 14:32:48 -0800 (PST)
Received: by 10.227.200.14 with HTTP; Wed, 9 Nov 2011 14:32:48 -0800 (PST)
Date: Wed, 9 Nov 2011 16:32:48 -0600
Message-ID: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
From: David Thomas <david.thomas@microbee-systems.com>
To: openembedded-devel@lists.openembedded.org
Subject: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Wed, 09 Nov 2011 22:39:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Since svn.o-hand.com is dead does anyone have a different repository?

SRC_URI = "git://git.yoctoproject.org/matchbox-keyboard;protocol=git \
           file://smallscreen-fontsize.patch;patch=1 \
           file://2-Add-new-modifier--layout--Used-to-cycle-thru-all-available-layouts.patch;patch=1
\
           file://3-Changes-to-improve-layout-rendering--especially-after-adding-support-for.patch;patch=1
\
           file://4-Add-rendering-debug-logging.patch;patch=1 \
           file://5-Add-support-for-loading-multiple-independent-layouts.patch;patch=1
\
           file://6-Add-layout-switch-key-to-all-layouts.patch;patch=1 \
          "

I am unable to find any source for these. It sure seems to me that OE
is overly dependent upon links that come and go.


-- 
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.


