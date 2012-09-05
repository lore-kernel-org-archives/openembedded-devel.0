Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9HTu-0001SS-TZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 17:25:31 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 05 Sep 2012 08:13:06 -0700
Received: by obblz20 with SMTP id lz20so407915obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 08:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=4j6ylAKAMoNU4cQFvl2UDDJVqngb4TCf/Ci3VmK/SxY=;
	b=Nl55ZTeb6CSB2jrHDZJ57WmaL1VhIR2PzxAwldUzqkbKlySYUwVVVgUHkDe8dPoIS9
	6FE7Msp2NYoZN9d6nrQG0OaKdwZbc/3qOUH3Y9daWeBdDSIDOOg7fu7CENLW25ljMiIF
	DzBw311UadBluWO5A/szsHw7aq6WSzfMo08ezD/WgF+YcXS4ICSxKVWdhPZy+wfH8oRx
	KiL+paqs9sMbd4mz46Vbtqac2pyYcRSg5bUJrBXluCUQtZgecfaXb1Kl3eilJXj/NQ2F
	69igMBz7/CGctg4MXt6KC+cG8VPW0d+In/RBJH3qV7//5NQaR9DuvA+W7Rg8VCoLiPrC
	eQEA==
Received: by 10.60.29.229 with SMTP id n5mr17073717oeh.103.1346857985085; Wed,
	05 Sep 2012 08:13:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 5 Sep 2012 08:12:44 -0700 (PDT)
In-Reply-To: <1346855574-1528-2-git-send-email-ml@communistcode.co.uk>
References: <1346855574-1528-1-git-send-email-ml@communistcode.co.uk>
	<1346855574-1528-2-git-send-email-ml@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Sep 2012 16:12:44 +0100
Message-ID: <CAJTo0LbVVkpE4qrX3PU3xYQtC5vymXH4gNqah0u0O+WA4gJLrA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlfK+5YN4MM3v27Zk6q022C+7HjMgsp/GGpr+Hiv4GcPubrf6cBjWFpFD6/H6rOR8IIimZB
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [PATCH v2 2/3] liblockdev: new recipe, new version of libcec requires it
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
X-List-Received-Date: Wed, 05 Sep 2012 15:25:31 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2012 15:32,  <ml@communistcode.co.uk> wrote:
> +++ b/meta-oe/recipes-extended/liblockdev/files/lockdev_1.0.3-1.4.patch
> @@ -0,0 +1,656 @@
> +--- lockdev-1.0.3.orig/debian/liblockdev1-dbg.dirs
> ++++ lockdev-1.0.3/debian/liblockdev1-dbg.dirs
...

This patch appears to be entirely the Debian packaging patch, unless
I'm missing a chunk.  If it's all Debian packaging then you obviously
don't need to ship it, if it's not then please extract the relevant
patch.

Ross


