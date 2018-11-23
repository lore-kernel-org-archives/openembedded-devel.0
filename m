Return-Path: <pbasista@gmail.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4826C63C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 01:50:51 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id f18so7849150otl.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 17:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=9mj6Qsix2eFIGzndFR4DdSrXxWW+7gS6Yk0zSkiGFwk=;
	b=Oe3KrLC8XlhpweANMVPW+YZMVwU171HLF+VQByUDXjIWOb2JKP21SJgRJUrG4dU30a
	Ex3dhGEfMnLQsN4preExMAIcKi0Yi2meeTGA6YNTq03/64ddIHmedKvdFexhLaFQOBxG
	nlg4h8SFze14iesgQGE1fjuDQgXsHiD9bILKNiKUKqnNFw4mJKfufc7QLMkUsv3DgNmV
	lHYwAgpi6YRvhd5Ck+E4N2+fbMRDfocawbpVvSQsDVxcwAqDXgAMDPrqaCNYTom98tKj
	kHuOenMwCp+0b21WYlWzMQEuTiK/kp+bz5XACBGt9nOioK/uUPswLfPdUQbmWyy40p2H
	tnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=9mj6Qsix2eFIGzndFR4DdSrXxWW+7gS6Yk0zSkiGFwk=;
	b=boUNyB1KrpsgMpzyYjLb0tREqHT4PSdbY8JSuZ+3SSnX5YkG6jolFzCi1D5mv0EKLm
	tPEdhhHX1iNLlUaV4/nDOa1cBfK9hoa+zKqYPTVkdstOIkh0BULy9u7hNZrcmlDJL+SM
	etFUlJcbKgMy6mSHk4RxhykeLMdKHzUbyi9EHH2XqMpisN47I1Wr28CSmTxX5sro+jFu
	+mk++zaC4njaNSESjkNXQx5GLTcnKhAHlzRhQEz2iFWppy3WntEilPoriDZnYwOjVxHl
	54s3jnRWitFoohXwdQwPJJ4Ge7cHoXuUoMqngRZC+8nGpkIDwvRKmwwGj0Ja0vr6dGpX
	PZ9A==
X-Gm-Message-State: AA+aEWYKypVQfW1u+NY5n//yqCDP03D4s0rAiCZA6Wa8w9JOMZhbybH2
	tv3ca6AcN/ZrVHK17SI/6Jz7ZWNFbCAHD+HusfphxA==
X-Google-Smtp-Source: AFSGD/UVJ5t1mxiyoPbwWJJrm7FcpDW2Mmil3Skg2ZblqG8E3+UYo6rsaTqRgBVzi4X9bkJAiOJEsYc65EvszhyPKuY=
X-Received: by 2002:a9d:2ae2:: with SMTP id e89mr812691otb.290.1542937852336; 
	Thu, 22 Nov 2018 17:50:52 -0800 (PST)
MIME-Version: 1.0
References: <20181123014853.26229-1-pbasista@gmail.com>
In-Reply-To: <20181123014853.26229-1-pbasista@gmail.com>
From: =?UTF-8?Q?Peter_Ba=C5=A1ista?= <pbasista@gmail.com>
Date: Fri, 23 Nov 2018 02:50:41 +0100
Message-ID: <CA+2FH0Jk14tEvt26JpRTQmvqPk5+8haoqBOMoJruoWKJ_PL7_g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH v2] Add a working Tvheadend recipe
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
X-List-Received-Date: Fri, 23 Nov 2018 01:50:51 -0000
Content-Type: text/plain; charset="UTF-8"

Please ignore, testing content present.

