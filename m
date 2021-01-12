Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.17068.1610488333753570459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 13:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R9euhajA;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 190so3225146wmz.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 13:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qjsRx1pg4p5a9msUehnJJfdIbGZ6o1pBKVtxc+HkPuc=;
        b=R9euhajALivjlqxo2x6cLMRVMqC8UxhMeNFE66deP3QEWOE1QrouYUdrNoYSsiKNEO
         bcWpbel4RQcvEM7/AIkmxH7sTeQn4tl9SVJSS/WkZKq8Eu/1Oo1dpjfVbaDVfOiJQ/Fz
         Pehf8ekdLVGeEKcq14LCZq0OfEeDrFmHFzz5K+FvCLh2bIs9Qa2IZIJs9J86WpSkYDlu
         IbYo38nXJGaM3AH9ubZ8hGyXIYbIiWCcF4REFDm7yozjnv927X9RuamI3QE+24gQo6PC
         pQ6JWyGEfJULhP+5RJ3bdO2k7mG7R9l+W4PEUyWwO+dzL3YwcTNvQACYZTzopzXn05wE
         7lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qjsRx1pg4p5a9msUehnJJfdIbGZ6o1pBKVtxc+HkPuc=;
        b=oo6RM9mRSiTOdf+fJa2TYlm/SKpbt2qyhZEVS3jjNpDzA++Go9zroWS4qp7ABGEiZJ
         ef9SxVBQ9dkafCf6TwzwA77pHomMhaUFkVUWc4esDbQUhpWij89s2IUoieuSdDKqYM7i
         JAHqh6SnkqIaMHt+EjE1MRW7N/qUWrpRJv0nb3yS69Nc9ASAz0utrKzt1wN5CdYQj4nj
         vHqitYD/rKmvWIOdqu49JcGwoeSF6FaBvOZn/FdW58LkDhe4ySBCsERmTMxDV5dF7A4a
         PT6zxSzzd4t2u/RFPMlR09fozzarj1dy1P0WeeaEUb+yp8Cyeq8mNm5nx2/h7fDJXrbL
         Cf2w==
X-Gm-Message-State: AOAM532ME/erK8Uy2FP9/LKGpnB3A2mec3s9dQz2kf2Jf2JFtr2wn06h
	pgxTcuykQAGui91X2zn8EWrR7n3mkeLDLw==
X-Google-Smtp-Source: ABdhPJyCz7tUhtCOiD4jcqKac4ToWSoBRfoiIwvhlv5ABv5yD1td1NEk8EHDJ6a04VIIgHWpk9xPJQ==
X-Received: by 2002:a1c:de41:: with SMTP id v62mr1123380wmg.135.1610488332381;
        Tue, 12 Jan 2021 13:52:12 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0538793397820a7f9846fa.dip0.t-ipconnect.de. [2003:f0:7f05:3879:3397:820a:7f98:46fa])
        by smtp.gmail.com with ESMTPSA id c6sm6881300wrh.7.2021.01.12.13.52.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 13:52:11 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/8] dconf-editor: upgrade 3.36.2 -> 3.38.2
Date: Tue, 12 Jan 2021 22:51:56 +0100
Message-Id: <20210112215201.3940196-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215201.3940196-1-schnitzeltony@gmail.com>
References: <20210112215201.3940196-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dconf-editor 3.38.2
=====================
Just a translations release.
Translations updated:
  Catalan: Jordi Mas
  Friulian: Fabio Tomat
  Hebrew: Yosef Or Boczko
  Portuguese: Juliano de Souza Camargo

dconf-editor 3.38.0
=====================
New stable release! Contains mainly translations updates. Great!

dconf-editor 3.37.91
=====================
First beta release! Contains mainly translations updates. Great!
Translations updated:
  Catalan: Jordi Mas
  Chinese (China): Dz Chen, Zephyr Wang 王滋涵 and Boyuan Yang
  British English: Zander Brown
  Indonesian: Kukuh Syafaat
  Japanese: sicklylife

dconf-editor 3.36.7
=====================
Just a translation release.
Translation updated:
  Chinese (China): Boyuan Yang

dconf-editor 3.36.4
=====================
Just a translations release.
Translations updated:
  Kazakh: Baurzhan Muftakhidinov
  Slovak: DuÅ¡an Kazik

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../dconf/{dconf-editor_3.36.2.bb => dconf-editor_3.38.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf-editor_3.36.2.bb => dconf-editor_3.38.2.bb} (67%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.36.2.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.2.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/dconf/dconf-editor_3.36.2.bb
rename to meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.2.bb
index 25f409c41..02e604f0c 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.2.bb
@@ -8,8 +8,7 @@ DEPENDS = "dconf gtk+3"
 
 inherit gnomebase vala gettext gsettings bash-completion
 
-SRC_URI[archive.md5sum] = "78bd905ed3c770a00c850d8cffec88a4"
-SRC_URI[archive.sha256sum] = "edcec8867f018589125f177407760c642bbbb52fe5122daac5905223d6b3e1c7"
+SRC_URI[archive.sha256sum] = "1253dad87e6213fbf313ff9ec9dc4358aa1b10261f28072c1dc0e0997b92f835"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.26.2

