Received: from mail-pd0-f172.google.com ([209.85.192.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1URTAA-0004Tt-1P
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 22:04:34 +0200
Received: by mail-pd0-f172.google.com with SMTP id 5so2150998pdd.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 12:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=UdZt6MD5oh2nKDDajQvNuzalgtxh1feNbsXsPr/oqn0=;
	b=cEIR8zCpV5HN2alRqjjIiF9kYoslC6xsi4BbnsvuneA6aWtuv6NrxuClNu5rAhwA/x
	UkLTTNRkY5CEKHTXcvxz2c+6RxJ6p2nu1R7QNSnwbhoACqnOd1bpn0tEPUBS5y7KqMUl
	bW8SgOYQJZNI4+aAlHoPbYBLLwZUDG9KZWRfWCZcov8Xxg3up0hTcu4dC/yLBEGVL2iT
	BauUazuU1c8C96ZCPxczbqHBFEJbCp9Per7haBkj5PvFVVPexCL1bj4msWwQwqp+dY4d
	XnQVxeNxgBNKqt08udNOwncNexFGLkZMxSG/TqRRlpHz42rMQeSd+qz4yvbv/hmlxZhf
	r1Qw==
X-Received: by 10.66.102.33 with SMTP id fl1mr26270631pab.52.1365968825607;
	Sun, 14 Apr 2013 12:47:05 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id xz4sm17318881pbb.18.2013.04.14.12.47.03
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 12:47:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1742489.jOxEEgbE7k@helios>
Date: Sun, 14 Apr 2013 12:47:05 -0700
Message-Id: <1C395CEF-30CF-4796-B358-7305FEF0D5C3@gmail.com>
References: <1365867474-10261-1-git-send-email-Martin.Jansa@gmail.com>
	<5A70C57D-2410-4CCA-8842-147914F13AFD@gmail.com>
	<1742489.jOxEEgbE7k@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] llvm: Import from meta-java
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
X-List-Received-Date: Sun, 14 Apr 2013 20:04:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 14, 2013, at 12:26 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Sunday 14 April 2013 09:18:48 Khem Raj wrote:
>> also see
>> =
http://git.yoctoproject.org/cgit/cgit.cgi/meta-extras/tree/recipes/llvm
>=20
> That's ancient though. If there's a working recipe elsewhere I'll =
delete the=20
> one in meta-extras. (FYI, most of the stuff in meta-extras is old and =
broken;=20
> the layer is there to preserve recipes in case someone decides to pick =
them up=20
> and get them working again.)

yes there is I merely wanted to make community aware out there that =
there is duplication

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre



