Return-Path: <maurice.franke91@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0C45A603FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 07:39:05 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id u20-v6so1302255qkk.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=/OSmM9N7UXGiO2hTYuC8fS4skcthI+fnMisi0wFSGf8=;
	b=VElomBkWia1Z6wKhmPMgvdSWn2hBOGLbhCaDEM0RjyccjRvUyk6/RxMz3fVkCsW82k
	3KGeidM01qitC+TsmUGQssDCcjZFXCqH+wxMprgLmmcnitigKCwovEgfTIxOXyfh5oIC
	At+0jvcXFgdyrhzQDkgSSbAGrYCplRMnFJfnVGgU5SR+lFSI7nzSG7ezFZvMtnL9Qp7u
	aUFLfCrxA7XT9uwqk9FkKyWIUyNo+CSpRPDQ42ukk397bSjJVfbmIVynz9bU/SgVn123
	dh/gRwIvyYTvr22vNivqclQKIs7z1pb++l4OoxbkaZSjYvHbEU0/ac0qvTdmye9WQBRh
	Vm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=/OSmM9N7UXGiO2hTYuC8fS4skcthI+fnMisi0wFSGf8=;
	b=SVRD7G94+pX252c00iY+E8oecY/JhcVdzBE1ktYLYRJfmYROeXZSmRkbQHPa0+ZNSO
	Wp5u7MtqKjLIroKBUzC5wijKYXd+xHfhFMw2+Dmp6j8CnNJUKiuSebqHRvK46VXyNJOt
	IP8H0ILHcU8B5IPF4Zjlt42o6XG+lZPbMAB7RioGRXg0ko+tqE/OciRKU48dVgrWFnK8
	GB9ooA8+CFwL3BC1zySyZmIWQ5FmG0wNHdr29CuVKVh7YKUn3GFjpRvkzeadgfnFquKI
	2l3S5hBIiuKP5UQvwHnsJcQsdKMfRXxQpoKknhe3BpaxXHmEqjNGHS0bnkKsHufmIxtt
	eQlA==
X-Gm-Message-State: ABuFfogcOsHgUmLGQ5HNGgQChdO6T4eFT8pm/3mIOcDWClWD9nRFXdv0
	lswGDRIXadXKkR9Oue85sR+3gWf6u9Pytr23w/CkTzAX
X-Google-Smtp-Source: ACcGV61CLQZCRVfooZC+vJB8f+7QeR6K7nqHEbZZDPrKuaxXdeFRN6mFRbyFpa3yJbzalXWm+IAaA+7tMoZmwJeExBE=
X-Received: by 2002:ae9:e102:: with SMTP id
	g2-v6mr23019767qkm.128.1539761946534; 
	Wed, 17 Oct 2018 00:39:06 -0700 (PDT)
MIME-Version: 1.0
From: Maurice Franke <maurice.franke91@gmail.com>
Date: Wed, 17 Oct 2018 09:38:55 +0200
Message-ID: <CAMpd=9QHsQh3aV4HWWCEeKJNPymtye=RDvkUoM3va_u1GsUouA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-erlang] PR: erlang v21.1.0 support
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
X-List-Received-Date: Wed, 17 Oct 2018 07:39:06 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

here is a PR to support erlang version 21.1.0.

https://github.com/joaohf/meta-erlang/pull/19

kind regards,
Maurice Franke

