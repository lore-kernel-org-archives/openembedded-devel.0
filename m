Return-Path: <lchristina26@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 167A173A82
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 17:59:51 +0000 (UTC)
Received: by igbhn18 with SMTP id hn18so5827563igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 10:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=Z4osY1onFL6cxnIat8GUWK3yxxlKpiZvEx0AZArP1h4=;
	b=YPUSoaoNGUplwudiws88xTvUU6+PqXgUr/u6H0cLDxpn3ZeJfObVv0rn+HdmPHhWbL
	xuqfjLkgt5cKKD/xmzT2Nm9xMg9lvjfDLsixh3NLDKij1fbKSwK7cdjAMV2WpIMVw6f2
	YJycHYvyHr3nyVc3Azdg/vzVd5ZzdXl9d6rPnHvtx4qce/e8wEbDhNklc4xF/YwSUC3f
	glpcNbcr7pJBBH/6D87tlnChoRiBaqQEulGNr32LVzdZDGdCcyUO4jwC7WjfVSUP0QbL
	tXlYxF3eeuzePhSCTZFJKj+p4I81pLeRPPB7jWD/JmB9NwBRQtWp0PQwbzw7p6xn+xve
	bDQA==
MIME-Version: 1.0
X-Received: by 10.107.129.88 with SMTP id c85mr26969443iod.81.1426010392914;
	Tue, 10 Mar 2015 10:59:52 -0700 (PDT)
Sender: lchristina26@gmail.com
Received: by 10.64.41.166 with HTTP; Tue, 10 Mar 2015 10:59:52 -0700 (PDT)
Date: Tue, 10 Mar 2015 11:59:52 -0600
X-Google-Sender-Auth: gsjtSpPE5jIGZfx41G5i5Deapus
Message-ID: <CAL0pqZ15mf+jANcqzD=EAYs-BOKThCdWdzO2J2aRaV1v4moO=g@mail.gmail.com>
From: Leah <leah@wolfssl.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Recipe Name Change
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
X-List-Received-Date: Tue, 10 Mar 2015 17:59:52 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

We have recently changed the name of our product from CyaSSL to wolfSSL. I
would like to update to a recipe reflecting this name. Our current recipe
is located at
https://github.com/openembedded/meta-oe/tree/master/meta-networking/recipes-connectivity/cyassl.
Should I make a commit to delete cyassl and a separate commit to add the
new wolfssl recipe? Or should this be done in one commit?

Thanks,

Leah


-- 

Leah Thompson
www.wolfssl.com
leah@wolfssl.com
406-570-1389
Skype: lchristina26

