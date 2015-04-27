Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 615AC73D9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 17:12:44 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so113701319pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=nOvJTR2wQ/7Y44QaVYZKqisQtqRy2asyKhG999GJw7I=;
	b=c0gwIW9XyT02Jar1rt3GUIAYbjNciAnuyc0bsKzeJfIU8MMHhZ5EF40HJMrK2XAj+H
	dMS6vTIbZiN8lbchsVTD7Iv/wSq/zKo7gDcBhWYZVGNNldfSRnOcDC9E34xUSxan4gQc
	0BApyAU+9hPhLxTk54HiFZ8100AfICsNEeH+T8ZBdsg/MrIyiQCJyqE9iQJyxOxw3L7s
	fGQqKZsk7I55LowsDKcEPGly7yNLB3hI/o0d5VJ5oCoHYpVyAJVxXAMGvwSHWbeUojG/
	mvzuLI1Y9JopYDxE0AdenM3pyi9BIVETLaideY4qgcuCsBBins1DQtdlJt8edIikeOGq
	9wOg==
X-Received: by 10.70.35.6 with SMTP id d6mr23743561pdj.166.1430154766169;
	Mon, 27 Apr 2015 10:12:46 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by mx.google.com with ESMTPSA id
	gj9sm16428253pbc.77.2015.04.27.10.12.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 10:12:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKpOaUqG+jFvraPe+aru=yPdDLZ_U6mqqxN7JnnmS4vSAw@mail.gmail.com>
Date: Mon, 27 Apr 2015 10:12:45 -0700
Message-Id: <94B898C6-986C-4533-9091-A7DE5BADA4E9@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<1430153054-1252-2-git-send-email-raj.khem@gmail.com>
	<CAP9ODKpOaUqG+jFvraPe+aru=yPdDLZ_U6mqqxN7JnnmS4vSAw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-browser][PATCH 2/2] chromium: Remove use of deprecated udev logging API
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
X-List-Received-Date: Mon, 27 Apr 2015 17:12:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 27, 2015, at 9:53 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> Agreed. Please add proper patch header and prepare a v2 please.
>=20

Can you point to patch header guidelines for meta-browser ?=

