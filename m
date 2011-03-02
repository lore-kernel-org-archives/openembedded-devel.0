Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1PuoB9-0000yE-4e
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 16:41:35 +0100
Received: (qmail 23213 invoked from network); 2 Mar 2011 16:40:05 +0100
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 2 Mar 2011 16:40:05 +0100
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id 91NJ0nDCxXuS
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2011 16:40:01 +0100 (CET)
Received: (Qmail 23144 invoked from network); 2 Mar 2011 16:40:01 +0100
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 2 Mar 2011 15:40:01 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1Puo9h-0003mQ-B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 16:40:01 +0100
Date: Wed, 2 Mar 2011 16:40:01 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110302154001.GA13969@mi.fu-berlin.de>
References: <1299076864.3857.46.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1299076864.3857.46.camel@mattotaupa>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: minimal-uclibc: alsa-utils_1.0.24.2: task compile fails	with `warning: incompatible implicit declaration of built-in	function 'exp10'`
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
X-List-Received-Date: Wed, 02 Mar 2011 15:41:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

You didnt tell us your uclibc version. Try git.

Bye Henning


