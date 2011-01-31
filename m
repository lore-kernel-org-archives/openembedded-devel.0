Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Pk1CL-00023i-Mv
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 22:22:09 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id DD2E91D366D1; Mon, 31 Jan 2011 22:21:12 +0100 (CET)
Date: Mon, 31 Jan 2011 22:21:12 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110131212112.GA10042@ibawizard.net>
References: <1296465926-19202-1-git-send-email-sujak.marek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1296465926-19202-1-git-send-email-sujak.marek@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH v3] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Mon, 31 Jan 2011 21:22:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Marek Sujak <sujak.marek@gmail.com> [2011-01-31 10:25:26]:

> * depends on vmx25 barebox 2010.10 patch, vmx25 kernel 2.5.35 patch

Just a small nitpick.

It's not necessary nor wise or recommended to specify patch dependency in the
commit message. Git offers numbered[1] patches for that, which you should use
for such patchsets.

1. http://wiki.openembedded.org/index.php/GitPhraseBook#Create_patches_suitable_for_the_mailing_list

-- ynezz


