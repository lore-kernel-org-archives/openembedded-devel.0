Received: from [64.233.178.246] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jg5Z3-0006vb-WF
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Mar 2008 23:59:46 +0200
Received: by hs-out-0708.google.com with SMTP id 23so1424061hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2008 14:59:45 -0700 (PDT)
Received: by 10.100.110.16 with SMTP id i16mr14019920anc.8.1206914384795;
	Sun, 30 Mar 2008 14:59:44 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sun, 30 Mar 2008 14:59:44 -0700 (PDT)
Message-ID: <c384c5ea0803301459l3d808b51v64bad3155b7b3b86@mail.gmail.com>
Date: Sun, 30 Mar 2008 23:59:44 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Behaviour when bitbaking a specific version with DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Sun, 30 Mar 2008 21:59:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

when I perform a bitbake package-version.bb, whilst that package has
DEFAULT_PREFERENCE -1, weird things happen.

In my case, two versions get built concurrently and the output doesn't
make sense.

Can the bitbake guru's think about catching this case (and probably do
something more senseful)?

Thanks, regards,
-- 
Leon


