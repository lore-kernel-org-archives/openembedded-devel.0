Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5476FA77
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 17:16:02 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id h18so8628301igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=wEZcZfXeE2EeMCyL07hjH0+zqfCFalIiYclR+prNX1U=;
	b=CayOSdspasah+v+ozntME8SMZA3Q0zxJM9BwfcL0DBX9vIucB7SxrNl4eOkA4eDB9e
	301V6v4MoE9FoSB1GD6IzzOPozLIsORByPlTefgC6FbFaFoczHgz3zHZpYmKeYkrCX3N
	nWprHg2ipEKFB8fSpLZQAdODonfPF3KfRa4agpxOfelfOCzRlwxJStHI0s+f3MQ0VOa2
	gW4GLF6feAmveJ/CUSZu6QSn7VQ8IcVCfDfQr8usn1ZouBBlaqIjOWnlw6FRXMVDFf36
	RPnb8c0oXi/rAqYWKjqzcZtW/sdFO4IyetenTsTwSMUgWLZzPFB2rFJxFKa/HeZvsIok
	chPQ==
X-Received: by 10.42.235.197 with SMTP id kh5mr52619371icb.25.1395681363282;
	Mon, 24 Mar 2014 10:16:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Mon, 24 Mar 2014 10:15:31 -0700 (PDT)
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B5754DF69@COSNADEXC13.usr.ingenico.loc>
References: <1395313904-6600-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<CAMKF1sqxERqVRbKkSfz1eJ4s_8WiWLbpK10RHpvBdRzfi7e5FQ@mail.gmail.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B5754DF69@COSNADEXC13.usr.ingenico.loc>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2014 10:15:31 -0700
Message-ID: <CAMKF1so5GBMH7JehZ1wRt7A+x12_zr7yDEsUS_uPngn7JnfipQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] terminus-font: add new recipe for version 4.38
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
X-List-Received-Date: Mon, 24 Mar 2014 17:16:06 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 24, 2014 at 12:38 AM, Matthieu CRAPET
<Matthieu.CRAPET@ingenico.com> wrote:
> Most recipes are using ??= and not ?=
> What is a best way?

?= is better fit here.

