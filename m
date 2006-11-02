Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpanczyk@gmail.com>) id 1GfaP9-0007Ay-Ez
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Nov 2006 12:06:39 +0100
Received: by ug-out-1314.google.com with SMTP id e2so27821ugf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2006 03:05:45 -0800 (PST)
Received: by 10.67.97.18 with SMTP id z18mr401362ugl.1162465545533;
	Thu, 02 Nov 2006 03:05:45 -0800 (PST)
Received: by 10.66.225.9 with HTTP; Thu, 2 Nov 2006 03:05:45 -0800 (PST)
Message-ID: <abf5c18a0611020305x541169d2j66bdebebe2079a73@mail.gmail.com>
Date: Thu, 2 Nov 2006 12:05:45 +0100
From: "Michal Panczyk" <mpanczyk@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <abf5c18a0611011617i67e29487u897f42738677a986@mail.gmail.com>
MIME-Version: 1.0
References: <abf5c18a0611011617i67e29487u897f42738677a986@mail.gmail.com>
Subject: no signs of kernel in opie-image
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
X-List-Received-Date: Thu, 02 Nov 2006 11:06:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all !
I have a stupid question about an annoying thing:
I went through long and buggy process of bitbaking a opie-image for
h2200 and at the end I found out that the /boot dir in all my images
(ext2 tar jffs2) is empty. There are no signs of any zImage. The same
goes for modules in /lib dir - there is no such dir as /lib/modules.
Is this a feature,bug or have I missed something ?

Michal

PS. I have tried sending this message to openembedded-users list but
this list seems to be dead...


