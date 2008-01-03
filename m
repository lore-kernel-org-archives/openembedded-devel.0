Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JANi5-0002Zq-5a
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jan 2008 11:54:01 +0100
Received: by fg-out-1718.google.com with SMTP id 22so3038763fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2008 02:47:32 -0800 (PST)
Received: by 10.86.95.20 with SMTP id s20mr15476603fgb.63.1199357252606;
	Thu, 03 Jan 2008 02:47:32 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id v23sm21592206fkd.1.2008.01.03.02.47.31
	(version=SSLv3 cipher=OTHER); Thu, 03 Jan 2008 02:47:31 -0800 (PST)
Date: Thu, 3 Jan 2008 12:52:13 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <751916312.20080103125213@gmail.com>
To: Robert Schuster <theBohemian@gmx.net>
In-Reply-To: <477B8BCC.5080300@gmx.net>
References: <477B8BCC.5080300@gmx.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: custom debian package names and fully customized package names
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
X-List-Received-Date: Thu, 03 Jan 2008 10:54:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Robert,

Wednesday, January 2, 2008, 3:04:12 PM, you wrote:

> Hi,
> I have found a simple solution for allowing one to customize the Debian
> package names:

> http://bugs.openembedded.org/show_bug.cgi?id=3383

> Please have a look at it and tell me whether you want it like this.

> This patch is primarily meant to make custom python code to fix wrong
> guessing of the Debian renamer unnecessary.

> I have another patch that allows fully customized package names. This
> efforts may be useless from a distro building POV but is IMHO vital for
> all those who want to use OE to build packages for a non-OE distro.

> http://bugs.openembedded.org/show_bug.cgi?id=3590

> Comments on both enhancements are welcomed!

  Ideas look good for me. Wouldn't solution from #3590 supercede one
from #3383? (If the tasks were given appropriate order.)

> Regards
> Robert




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



