Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JNnhW-0006KH-3V
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2008 12:16:54 +0100
Received: by ug-out-1314.google.com with SMTP id i24so50748ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2008 03:17:07 -0800 (PST)
Received: by 10.66.237.14 with SMTP id k14mr6539207ugh.72.1202555827590;
	Sat, 09 Feb 2008 03:17:07 -0800 (PST)
Received: from widy.localdomain ( [88.231.85.196])
	by mx.google.com with ESMTPS id m1sm1418096uge.69.2008.02.09.03.17.04
	(version=SSLv3 cipher=OTHER); Sat, 09 Feb 2008 03:17:06 -0800 (PST)
Date: Sat, 9 Feb 2008 13:19:35 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080209131935.795df89c@widy.localdomain>
In-Reply-To: <E1JNg11-0007uM-FU@linuxtogo.org>
References: <E1JNg11-0007uM-FU@linuxtogo.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev rxtx: New recipe.
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
X-List-Received-Date: Sat, 09 Feb 2008 11:16:54 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 09 Feb 2008 04:04:31 +0100
"thebohemian commit" <openembedded-commits@lists.openembedded.org>
wrote:

> rxtx: New recipe.
> logic-analyzer: New recipe that uses rxtx.
> 
> Author: thebohemian@openembedded.org
[]
> ============================================================
> --- packages/logic-analyzer/logic-analyzer_0.8.bb
> 1ee8013dcfa98eec177fbdfbfbb2ecb8167f8dad +++
> packages/logic-analyzer/logic-analyzer_0.8.bb
> 1ee8013dcfa98eec177fbdfbfbb2ecb8167f8dad @@ -0,0 +1,38 @@
> +DESCRIPTION = "A Java-based logical analyzer for home use." +LICENSE
> = "GPL" 
> +MAINTAINER = "Robert Schuster, tarent GmbH Bonn <robert.schuster@tarent.de>" 

MAINTAINER field is deprecated in recipes. It's a distro setting
meaning an entity who is responsible for binary packages shipped to
users. To note maintainreship of recipe, add it to your entry in
MAINTAINERS file at top-level OE dir.


[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


