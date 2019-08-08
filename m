Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD9FA65CF3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 23:12:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e8so4691518wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 16:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8M+FusffJ5T8/JJPKVE1tZUtxfavMpj4D55vZoiBcSo=;
	b=H73Utivc6W/B3FyBx7wBalzdfFO8InjBhKJeNvcJLM1HnTQOl/66CHRSzjkjIek3kX
	o+79mPCU+ljh9JEXJR436ugo36sXTLPBQfy/35SJtsWt6lOQ1KOEIeOlm8t+H7liOtu6
	ht78h26ny0af9gWqXB1e+V8o8wH2v8bZRZloyQaZ6qm0r1mb+bb9NJNnIeJmTdb5g/K0
	feLHbyHtG23LO1YrrNRszLPER0eesrgisdafntO4YBnUobgxm0OmjpHQx3tQ95qxMuE5
	PjfSLBdwWwNQMeb4xRAxcEaZvvrwh+BLH3l1pLOqbmEGmsyChUAPjFRbcxOUUP234tCm
	DSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8M+FusffJ5T8/JJPKVE1tZUtxfavMpj4D55vZoiBcSo=;
	b=spObaMAlS6hhNn00xx7+0mN9bO07z0EZP46DJhsJ1ftCFWdM1FJKVN3gda49K6vhkG
	s/uU+4LrLuzhhm0X1V3rQLJG1KW95SW7GA+XyJqdw8a6gpw9mBIaJsAIVCotQeZn5Zz4
	F16UuMCUljqNt5ajUgrdK67rS41zG1LeXm0GM45d/I7Qf9QPPUfe9czQyVLIpD8LpqBq
	Rt166Ja77wb0WF+39qYw2/DsWErnOV3xSwFmCeL1dRwci/JJpXh46UpJIBj2WOo5ohJ3
	qMZpCQom0t/5qRJjG3r8dRCa6jpFZZZnm1Y/do/Dh5Pc8Pjq9Uft6y7P7fyIaN5DH6Vy
	N3fw==
X-Gm-Message-State: APjAAAUXO8R3N7c92zYKqm5KxZ6E0WMwwMdpkHAQnCf+ydQ+kgSnn1K8
	7XyGQQjsB4fN4L/MZKXl5jr/jCGx
X-Google-Smtp-Source: APXvYqxnhGn69MznbIX3thPVqNt9KTopxGQJDzy4FtBfGiy3ZFYgKZ1o+WJAEL322EBb9WOgQzoonQ==
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr7106245wmf.176.1565305976294; 
	Thu, 08 Aug 2019 16:12:56 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F025B43B1D39927B00A68F0.dip0.t-ipconnect.de.
	[2003:f0:7f02:5b43:b1d3:9927:b00a:68f0])
	by smtp.gmail.com with ESMTPSA id
	s15sm74357695wrw.21.2019.08.08.16.12.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 16:12:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2019 01:12:45 +0200
Message-Id: <20190808231245.2941-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] meta-xfce: Make Kai Kang layer maintainer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Aug 2019 23:12:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/README b/meta-xfce/README
index 84b019896..70ad47a2d 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -19,3 +19,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
 
+Layer maintainer: Kai Kang <kai.kang@windriver.com>
-- 
2.21.0


