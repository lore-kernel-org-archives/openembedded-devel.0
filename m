Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id B971E79306;
	Sat, 15 Sep 2018 16:30:58 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id x7-v6so11605171qtk.5;
	Sat, 15 Sep 2018 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=wsMEIuuLzX9/25UdSqn+mndkhWJXBpst4rqosZ0P2pA=;
	b=FV51uaazyM/24HcLhIRlZCsUQQzyrmyrqz6nTjpanofUkgzy/Ynliln0Ph9S32+jMV
	ALQcGrOzABcacSNqPFt6cBdgvKuseC4dCF2pioVXrBl9yBXcF+9mBNzhbh+rDIB4iZR/
	9HpAFZ6yMqZ0VQpV4n1bBmGKcwOyeCyNxbHkhE8JW6OjFggYShEn+PheVOA2ET4wLSqb
	C8ye7IZLoV/ukC8t0Q0cTVXLC2ehFtsTpPrfC4CrDdVHXe08OXFXs0zhcpfXVGQ6a0MV
	+MZtT3yh1iObcsk8Llew8WIgSpJGa0OqcXt0wCrz44J/FV5VuZE/2yvG0+IZw4rZt7Bm
	B17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=wsMEIuuLzX9/25UdSqn+mndkhWJXBpst4rqosZ0P2pA=;
	b=GYYuKZa/bXupYcm3AZ9BB7Waq3MdmZx/REi4PUWsLoGpdzHqOja7/j6SH/9u8AW1Jj
	fTJGu852VjJGQDtbKCdUh7hqlGaroOB8ZpUSDS/cyIEowFsXReBGYrqjloo2zHiSGLLo
	6NbMQPgDUn6V7t1Cknx4bE91IS4zq8MTzmAPamr+vniCj03kMq6BKcGFTy/Fy8UCw7Sl
	zHT1zpiKwAZc4Z96NBv2OJG1FyxUmstO2XwX76wynPv2ZECZgHndqo/FXnrj9RvfbYpB
	gloyfOIbEZCrdUbgq04mhzyEKN+9oIPt7g6sNtQtq33zO1YCxtk2R899PfsNm0Xm8J/l
	MH6A==
X-Gm-Message-State: APzg51DVs3p7bQGIatn8dULs85yYnT+87BbarhemrGfA+KM+DdDs3s1l
	i4HxtQfeaQpup7wIJOMw2Y3A8A8AguUeM0ub6M0jJw==
X-Google-Smtp-Source: ANB0VdZ9HNoEuPE97bEs50k+CjxI8Qj51/EqxN0nJdaWNWFC+FqtgnH159juXfFnc5/gwgPMLf/AXbpo3dSnKCdZst0=
X-Received: by 2002:a0c:e847:: with SMTP id
	l7-v6mr12519186qvo.196.1537029059592; 
	Sat, 15 Sep 2018 09:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNRJaBrHJmR3McmfUdMaaqStfbwwBGtnzRbtWVff_yuCqQ@mail.gmail.com>
In-Reply-To: <CAGCTLNRJaBrHJmR3McmfUdMaaqStfbwwBGtnzRbtWVff_yuCqQ@mail.gmail.com>
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Sat, 15 Sep 2018 18:30:47 +0200
Message-ID: <CAGCTLNStam9H=B5JiGpdoCGAxVcyzBtTstD04AZVE2sQWtNZEw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [openembedded][Qt5]: typing problem.
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
X-List-Received-Date: Sat, 15 Sep 2018 16:30:59 -0000
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Sat, Sep 15, 2018 at 10:51 AM
Subject: [openembedded][Qt5]: typing problem.
To: <openembedded-core@lists.openembedded.org>, <
openembedded-devel@lists.openembedded.org>


HI everyone,
I am trying to build custom image supporting wayland weston instead of x11
and support qt5 apps.
I successfully built it but when I try to type any thing in the text box in
the qt5 app.
no thing happen !!
also the initial text in text boxes appears very small!!
I added "fontconfig" and "frretype" to the PACAGECONFIG variabl in
qtbase_git.bb recipe..

How to solve this problem ?

Thank you in advance,
Regards,

-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

