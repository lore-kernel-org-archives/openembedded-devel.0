Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oxmbg-0006v1-62
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 22:04:56 +0200
Received: by ywa8 with SMTP id 8so1587024ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 13:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TiVB3QVOxYPyfP8idAE9KVICgiecLQA/9H2VnX99nMM=;
	b=heU2vvAp+4sBvRyHKhyVym0S8xHtRI0VrQbnJhDcUj+Xsm6IKcYjn1JN/qK6JIS7Hc
	GabH/cIxCzbTx5HTHsp2QWjlHfmz1DUVTXNTf+ldbx8bmMUXKkyNqgX7qjXent/mHFtU
	kcTXOug3kpmWVVHTfsIPAVZiTiSuxWSdJdHbo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=e8/FKyOveT9fAcVJNU67XCBPdsFLW1dP6XH0huh68uFbSZy2pJC9h1M6jn+C894C1E
	evtum6RxcTO72t6JxNRXI+RgmyK1IQCMjxzDrh24qYjNbwkVP3EE5P7PV/df3u+DP+37
	9DO7vbt9vmcsscLkyMsnmnLn0UxmKFzFNpT9o=
MIME-Version: 1.0
Received: by 10.150.216.2 with SMTP id o2mr9635340ybg.420.1285013091670; Mon,
	20 Sep 2010 13:04:51 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 20 Sep 2010 13:04:51 -0700 (PDT)
In-Reply-To: <1285009075-19687-1-git-send-email-khimov@altell.ru>
References: <1285009075-19687-1-git-send-email-khimov@altell.ru>
Date: Mon, 20 Sep 2010 22:04:51 +0200
Message-ID: <AANLkTikS7gM7rpt_45rLF=uT4-hezt1Bwa3hATPxufgN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] bzip2: update 1.0.5 to 1.0.6
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
X-List-Received-Date: Mon, 20 Sep 2010 20:04:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/20 Roman I Khimov <khimov@altell.ru>:
> =A0* fixes CVE-2010-0405
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>


Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


