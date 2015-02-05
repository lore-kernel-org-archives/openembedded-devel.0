Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id AF43B7261A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:15:09 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so6009328pdb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jyTOLYn8qc7dCFecN24iNG8mx62cQEKUBEQ5kCCRXpE=;
	b=s5lMNJWMImyVhNVt5beMOb/hf+B2O4jKmXMmJMdeCuN+WquYCBb4+DGFYl+ZVWaKUn
	pfZNwXoLX5xXbMzXibtOAUdmmyJ08gZWN9qHLFTnFtXBX29YmdYaW0DWqqdaC7MCI8hQ
	bqf69hA6vD4+QatpKPE2RGTwI3ODwZ846h27rE9NSI/JgA57f6uUKgJhDPuaCFip6+k1
	+Yx/E8LUIucwVMn0txAfAZsXWEBVoxtB3qqSK7eMbFQjaOllyr9WvSaxBRKGkED/qgfn
	LM2HzgjeuTwPQWz9+e+/3ug9rubpDw+kh+yphNfGmFvgZxcGSY6EN2/kFhFfPmBiojTC
	1fiQ==
MIME-Version: 1.0
X-Received: by 10.67.6.225 with SMTP id cx1mr6617869pad.1.1423152911487; Thu,
	05 Feb 2015 08:15:11 -0800 (PST)
Received: by 10.70.44.167 with HTTP; Thu, 5 Feb 2015 08:15:11 -0800 (PST)
In-Reply-To: <CALbNGRQEfMiaVMKVVFnUFdZNokBQ=F5eQCDe7o75H507=uwHvg@mail.gmail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
	<CAENGNhfzVESxGmQVz3SA6gGv_H+NBE+q9J+FB=Zg1J4WHdg=CQ@mail.gmail.com>
	<CALbNGRQEfMiaVMKVVFnUFdZNokBQ=F5eQCDe7o75H507=uwHvg@mail.gmail.com>
Date: Thu, 5 Feb 2015 17:15:11 +0100
Message-ID: <CALbNGRRSRUewugNgWeQqguEgHMjmiLetzi=v6rqWXYXy4WJ=Vw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Feb 2015 16:15:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2015 at 5:11 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
Another question: what PACKAGECONFIG are you using for qtbase?

Andreas

