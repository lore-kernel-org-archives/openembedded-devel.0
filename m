Return-Path: <cliff.brake@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 12D716A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 14:52:15 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id i17so6846071qcy.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=XJCASCcdvn5/LPt6PYw/lCBYQbf9P1MZZEBMy6OdGrM=;
	b=UvB3zNm3cIy9c/0QdncI+gP4JXmAKlNYnquWWbbM6AwPehSjC4vV38eLlC83uw+pJ9
	9f0tyjngc5IMijV9O6fotNyWVISDIrZ6pU8GsfniNfuE/Urrx7gLLYxMMszt5MEMxwzX
	SzKeoKlQLNp0Im5fV0BZjuFsYh6/On1jv0H0xvvzyJxwQYxUFS7X3WXCLgJtrRxN95W9
	1OUmnC77qjy+l1VtwIJyiKj3vbw7OT2xgwUxWMidWVvnZSbEzJDlKi4+SmdNH0BMdeGL
	U5rj1QvVisfQ0I/OTefyJZzT+piREntsFGNQUShSzxvf+VnCLmzPxSc6SoZDJcg9Pw0Z
	yguA==
MIME-Version: 1.0
X-Received: by 10.140.43.244 with SMTP id e107mr9716380qga.10.1413298336907;
	Tue, 14 Oct 2014 07:52:16 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.89.227 with HTTP; Tue, 14 Oct 2014 07:52:16 -0700 (PDT)
Date: Tue, 14 Oct 2014 10:52:16 -0400
X-Google-Sender-Auth: bKTrTuX5zCx6FVAl-sbZO-99a_A
Message-ID: <CAOd_LFzDxbcVWX10B=KS5F-LGYVv-XRza-HmqXtGt8QraNMojA@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][daisy] pull request imagemagick: fix SRC_URI
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
X-List-Received-Date: Tue, 14 Oct 2014 14:52:27 -0000
Content-Type: text/plain; charset=UTF-8

The following changes since commit 8e6f6e49c99a12a0382e48451f37adac0181362f:

  libmikmod: Adjust SRC_URI (2014-09-26 09:22:37 -0400)

are available in the git repository at:

  https://github.com/cbrake/meta-openembedded.git daisy

for you to fetch changes up to 518cd119a8724dbd485a5d5c5047de59e8fbd652:

  imagemagick: fix SRC_URI (2014-10-14 10:49:48 -0400)

----------------------------------------------------------------
Javier Viguera (1):
      imagemagick: fix SRC_URI

 meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

