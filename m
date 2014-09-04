Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 61CED7149F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 18:36:15 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q9so3737623ykb.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 11:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=6U0ky3NisAGLc8WkNfWIx+cuU0wSHPDoxDrOcOi9TPs=;
	b=SFPuCexK0e8LeS+yW36uVdrouo0+tkMzVPgs9NeMxu2HE46qMFFMGPb7vc6Ko2x33l
	FeWD/sgPGXNtXRRZFaL2Pw5Tc+DLD/roWdyVB13NzFsUOc1vr/YSQpdl9W97i6fxSFjc
	wf4NeBADc/9FHXp7HYzbnQmrQsEqwvrUf9P9tOi6eVEpch2qjm/6jIz1CWEVX0kN9avO
	vn9kohH2DoBwYPo07gRtkT8uXm0E9T24SoNEtRG3kSr1mlXInndUBpIBrxG9e63Hfvs9
	fxHnazykNsPgsO5CTRBxFnvjPH8v4NqSKKa42hJko2LM6D6nEuAwrxI8JuNUMa9oVxvI
	Rq8g==
MIME-Version: 1.0
X-Received: by 10.236.130.210 with SMTP id k58mr7145391yhi.102.1409855776845; 
	Thu, 04 Sep 2014 11:36:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Thu, 4 Sep 2014 11:36:16 -0700 (PDT)
In-Reply-To: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
Date: Thu, 4 Sep 2014 15:36:16 -0300
X-Google-Sender-Auth: IH62O8IJ9i_UhkKY9IShgfEi3Nc
Message-ID: <CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Error while bitbake meta-toolchain-qt5
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
X-List-Received-Date: Thu, 04 Sep 2014 18:36:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 4, 2014 at 4:10 AM, Switesh Fulpagare
<switesh.fulpagare@mindastoneridge.com> wrote:
> Can you please look at this post? I think it is problem with 'git://
> qt.gitorious.org/qt/qtwayland.git

I just sent a patch fixing it; please try it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

