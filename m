Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1SIEIZ-0004v0-TE
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 09:18:31 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D324C223263A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 09:09:13 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4C9E02232639
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 09:09:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052225154.adsl.alicedsl.de
	[78.52.225.154]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 09:09:13 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 887033C4C6; Thu, 12 Apr 2012 09:09:11 +0200 (CEST)
Date: Thu, 12 Apr 2012 09:09:11 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120412070911.GA4345@rhein.zuhause.netz>
References: <1334185891-25460-1-git-send-email-philip@balister.org>
	<1334185891-25460-5-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1334185891-25460-5-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-oe 4/5] gnuradio : Update to version 3.5.3.
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
X-List-Received-Date: Thu, 12 Apr 2012 07:18:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 11, 2012 at 04:11:30PM -0700, philip@balister.org wrote:

Hi Philip,

> +#do_configure_append() {
> +#	find ${S} -name Makefile | xargs sed -i s:'-I${STAGING_INCDIR_NATIVE'::g
> +#	find ${S} -name Makefile | xargs sed -i s:'-L${STAGING_LIBDIR_NATIVE'::g
> +#}

is this a left over or actual needed?

Bye Henning


