Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1Iyua1-0000gl-14
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Dec 2007 20:34:17 +0100
Received: by nf-out-0910.google.com with SMTP id h3so2280856nfh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2007 11:30:55 -0800 (PST)
Received: by 10.78.123.4 with SMTP id v4mr2245762huc.1196623854664;
	Sun, 02 Dec 2007 11:30:54 -0800 (PST)
Received: from ?10.0.0.6? ( [85.99.157.98])
	by mx.google.com with ESMTPS id 35sm3822630nfu.2007.12.02.11.30.53
	(version=SSLv3 cipher=OTHER); Sun, 02 Dec 2007 11:30:54 -0800 (PST)
Date: Sun, 2 Dec 2007 21:32:59 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <32693366.20071202213259@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Cc: angstrom-distro-devel@linuxtogo.org
Subject: [ANN, RFC] dropbear-early
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
X-List-Received-Date: Sun, 02 Dec 2007 19:34:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  I've recently finally crafted something I wanted for long time - a
package with script which allows to start dropbear ASAP after boot, if
user chooses so.

  So, I'd like to welcome everyone to use it for debugging their
distro, and for Angstrom, I'd like to RFC adding it to DEBUG_APPS, as
it offers great help debugging hangs and hiccups during boot. What it
is installs is below 1k.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



