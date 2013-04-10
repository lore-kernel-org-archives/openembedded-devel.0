Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPt8h-0000Kj-0I
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 13:24:33 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz11so248135vcb.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 04:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=L/mwgvPzz4D7cVE6Z70EEgpfN1iWT68+dXq443r0W3k=;
	b=lj3mclJgS6Vw8dyFIy1bAfxSmMWtVzBfSjm0WYjFqaXoSp+V0hPz3GPjx2OdoaCxph
	wDudruvNfbIplOHgWWWssEfKA39MRtAHqPJvM6SXB+h5oRBz+L4KgV9DQzerP16TPGK5
	NeiKOeAe2iRhO6XCPTpJlwW2AnYmWsdK+q16qWYZ07Sogn5ZrpXrrAygAsGfBje8BaAC
	7kNhrfenlCSk3KSpMHXfT6wFcv/2+zjpGmEydD+JkAkWMaAX+dcyWMDXbj06pPzmyW+l
	4mkRPkDSKtQ3i73AgxwolRxMs3N7GcWxCbjlCo1j5tXhoEo4zA+L/FVijPCSbwkD9JXF
	K9pw==
X-Received: by 10.52.73.234 with SMTP id o10mr925197vdv.29.1365592029263; Wed,
	10 Apr 2013 04:07:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 10 Apr 2013 04:06:49 -0700 (PDT)
In-Reply-To: <F52AA45C-FB86-4749-95C0-0DA24BC50DFB@dominion.thruhere.net>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
	<F52AA45C-FB86-4749-95C0-0DA24BC50DFB@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2013 12:06:49 +0100
Message-ID: <CAJTo0LZga4SoPiHOCVTQizutkcfe-417jx+fuHxCira--QWiGQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQn5ZuA5qhT4GyMhmRQOVXWqo1TDFBe7oUekIQgFi09T1QVVwpbC2ZhXxfnE6mAYjjwolhxi
Cc: enrico.scholz@sigma-chemnitz.de, Martin Jansa <martin.jansa@gmail.com>,
	otavio@ossystems.com.br
Subject: Re: meta-systemd future vote Was: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Wed, 10 Apr 2013 11:24:39 -0000
X-List-Received-Date: Wed, 10 Apr 2013 11:24:39 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 21:08, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Upgrade paths are totally broken anyway, so let's go for 3 + A

As you keep saying this, it would be great if someone would do an
upgrade from danny to dylan and actually report the breakages.  Thanks
mainly to Martin the bulk of the package transitions that I'm aware of
have replaces/conflicts/provides in place.

Ross


