Return-Path: <marek.belisko@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBB3770AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 20:34:39 +0000 (UTC)
Received: by wijq8 with SMTP id q8so99390397wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1LZV8ViWfUuiniIxHT56yDEARF74sA2pliiwbVb3iXg=;
	b=LOhkgi0qvI9/XRa1CNiog5p2Ezrt/d4XfL5j9filqDFNcDd8ZDlc2yaCa9dmHCe4nr
	NFi2UF52VVByc7mPpjvlqifDEQmUhkI4vPNatoivOj9BfUu34vY9TSqBJWEs8sETZeF3
	c6J+IOiSwpd9cfAcrNEN3FlLt0BMV6emoDh+IB6qlL6M2KKzUNZg7nqKM4eThW3AW+Sx
	hy3i6Sst1Ey2GxkXHkerMfsU2SZhVJZjQ9Y61fwfvTypiDlKWRgqc6i+PR8YkQ+aPWVe
	3y8beeXbfYC4r+7ugV12cJoo2cySjx3bg5T8bwyjMF1m+PVwzFFY4ywAKlqKEiZPCqso
	9MMg==
MIME-Version: 1.0
X-Received: by 10.194.48.102 with SMTP id k6mr7136788wjn.124.1444854878611;
	Wed, 14 Oct 2015 13:34:38 -0700 (PDT)
Received: by 10.28.12.75 with HTTP; Wed, 14 Oct 2015 13:34:38 -0700 (PDT)
Date: Wed, 14 Oct 2015 22:34:38 +0200
Message-ID: <CAAfyv34Ly=rBg=S60qYbjtszCLp7kUaQqwQ9taPen3s3fiokVg@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: meta-qt5 - Qt5LinguistTools cmake problem
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
X-List-Received-Date: Wed, 14 Oct 2015 20:34:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm facing the same problem as already reported here:
http://patchwork.openembedded.org/patch/97183/

when using qt5_add_translation in CMakeLists.txt

Mentioned patch isn't included in actual meta-qt5 master which I'm
using. Is there other solution or can I use this approach? Many
thanks.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

