Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id A05906A48E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 17:57:17 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id c13so716859vea.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=eIh35eo83ITC5XAyWNJFLIWxYjH5UehRoCbdq5/1DJI=;
	b=C7+nYlcPNm/8QdNZq778TmVycg6eHhzSTNAfdVjt1UkaAnjTVd0aqTS59GgMqj91CZ
	uoBYSArY/dFsZlXL1xKc4HO068hQQ/w5+GOBLxJdOFj5Qs5B6QyviWiwuvq0QgjBm1Z0
	IwHh18yUXXVYm89iZdk0RE9E9xvgWr5NMzlFqwk6vIWMbQV/bdz2L7jVQpj2/4D67V+l
	lBdLGPdVRvvIbW03eDpVbgp2Ct04Gqmbch1EGtyvLAqZflVR9zscsERnnRT9S9xUFf31
	Dz4SeCNR8Cd9DigzfGB1XpSzEZJFENLdAW+U8Kz4tmpzOjREYV16FWu/ci4qcaoX3DNN
	bD6w==
X-Received: by 10.52.65.238 with SMTP id a14mr1110022vdt.24.1371232637976;
	Fri, 14 Jun 2013 10:57:17 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Fri, 14 Jun 2013 10:56:37 -0700 (PDT)
In-Reply-To: <961DCC52-526C-4A17-9951-9C56FC51C2AE@gmail.com>
References: <1371230436-10343-1-git-send-email-paul@paulbarker.me.uk>
	<961DCC52-526C-4A17-9951-9C56FC51C2AE@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 14 Jun 2013 18:56:37 +0100
X-Google-Sender-Auth: QAncRRGjREnIMf6lVe1fCEQQMH8
Message-ID: <CANyK_8ff6m+toq7Ej6U4+g4g_b=2ebHt8HyMwP6g-+pcad3ppA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/2] ipsec-tools: updated to 0.8.1
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
X-List-Received-Date: Fri, 14 Jun 2013 17:57:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 14 June 2013 18:38, Khem Raj <raj.khem@gmail.com> wrote:
> Paul
>
> There should be already fixed see
> http://git.openembedded.org/meta-openembedded/commit/?id=4136f35d5bcdd4e386ea8f105540c64e2cff0cf7
>

Sorry, didn't update my git tree before sending the patches... Just
came back to see that my bitbake world had succeeded and sent them.
Ignore these then, glad to see it's fixed.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

