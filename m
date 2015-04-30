Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vn0-f50.google.com (mail-vn0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id BE00072A85
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2015 06:18:10 +0000 (UTC)
Received: by vnbf1 with SMTP id f1so6203926vnb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 23:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=3LJYGsQi5n3rodpalzi/FfQ4df7hPupgB+vPANPOzoA=;
	b=dJ1r6cMFTiH0cOAEh3xijXarqvNA+0fIUuG+ZiAz1LlH3cmOllUgRGHberl+PYyL4M
	3L8vKAAyREIb925S5OkWz43/ylMRVdJvynDDXyCmdhYW5e7E2gz29c9K6RRr+PYVl4NH
	Dgr4srDl44WLG2/QbWH1t6tD7c2decxX/omyK9dZDcJKZEiXY/KMY3AyNfXMksCXO8cR
	RAXmbSgUCHLIU6h/um1GjYkg7m832TPNC7+tsADNcgGmgotmQKjIPXSP/glK4UCgbzin
	Bq6O+aad1nI5Ma75H/BWSeVfLzQGrqDRD4z+KHzx46d013UzdI+VlFuxqFhUlWjUlQg0
	jNog==
X-Gm-Message-State: ALoCoQloCSyjnjrZ5cr+89imycGw8/6MA58Em+19ToLdtqrMRZlBjxG4qhc5jnCFxoTOshRI+1cx
MIME-Version: 1.0
X-Received: by 10.53.0.226 with SMTP id bb2mr4656471vdd.66.1430374691701; Wed,
	29 Apr 2015 23:18:11 -0700 (PDT)
Received: by 10.52.227.131 with HTTP; Wed, 29 Apr 2015 23:18:11 -0700 (PDT)
Date: Thu, 30 Apr 2015 11:48:11 +0530
Message-ID: <CALRGHr9GkKB59wiw8Csqiic2gAE+CVxr_AXAXREF5jUbKGVotA@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Sandeep Gound <sandeepg@mindastoneridge.com>
Subject: Gstreamer error for Qt camera code
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
X-List-Received-Date: Thu, 30 Apr 2015 06:18:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi ,

I  ran into error while testing qtcamera example code on Qt 5.2.1
http://pastebin.com/WbenK54H. I'm using yocto daisy-1.6.1 .

Am I missing something in .conf file?

- Switesh F.

