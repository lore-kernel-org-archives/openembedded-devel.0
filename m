Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6K6E-0000Sx-T5
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 13:09:07 +0100
Received: by mail-ve0-f174.google.com with SMTP id pb11so2945907veb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 03:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=LO7gHHF/rNYWGavPMB9IN9KSEg88sZIUQRgA5VXAdR8=;
	b=Z2iWoBSs7bzGk6NE8iykfwqjK/tpITxVcnRkq2s4mzG6cT4BwkQgIDhmTrb2o9M+4o
	OZHQDwh5XteXOO1mFhy3PWCdne9fwHE4XU2GuqJWLdGTlKi9jhoe5dcV3c7j/jkNv+E3
	z8MqAHvD2unFyRugV7DMVbzu/vLbDnaCdw/G1yfnJfZgpWNTDB3d4FeZWPUTowYnN0j+
	I7iLEoIzl5jOWsuctc4t6ai1clb6l3Lv7cn9QmNcIy3QHv/2WSegWT+WBayY8GWMvlNl
	U6Zr4Jh9NFcI3ZeZXsjehGI4BDQdilQsKiYbZnsAYHzcQRxM/9AhCX7rN/gq+kmkU4e7
	hALw==
X-Received: by 10.220.156.68 with SMTP id v4mr2734938vcw.10.1360929182970;
	Fri, 15 Feb 2013 03:53:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Fri, 15 Feb 2013 03:52:42 -0800 (PST)
In-Reply-To: <511E200D.3000907@communistcode.co.uk>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
	<CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
	<CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
	<CAKSKmM2bC1C65ca2RZcKvz3yTEM_9+yHFq95yMD+hJPWpYziCA@mail.gmail.com>
	<CAJTo0LayOQb60HB--SWiWBYau=ECryZx7Kn_QD21-G8kEMZiog@mail.gmail.com>
	<511E200D.3000907@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Feb 2013 11:52:42 +0000
Message-ID: <CAJTo0LbUmwwPs2eRvOBSCzep0OHx3KRn+XPO5xWSpcgbuN0RjQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlI5AyRYQQFsmC7Wl1b+Yl708YemjhFsygcvm0Cn8kim7A9N3z7t9uaGv3z8TmgTvcXByal
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Fri, 15 Feb 2013 12:09:07 -0000
Content-Type: text/plain; charset=UTF-8

On 15 February 2013 11:46, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Or as I mentioned above, use the git commits that the meta-toradex wiki
> pages recommends.

Just actually looked at that page.  It's almost like their writing a
case study for the reasons to use git submodules...

Ross


