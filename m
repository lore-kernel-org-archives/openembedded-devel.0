Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id BC6B571368
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 11:17:26 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id q200so1171233ykb.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=yD8HhMabWesLnuB13RBu1GMkAOMu7R9z0pmBnul9GLE=;
	b=hYJnF107xfxRGmbH+E1IEdpTSCu0xJ/sGAdhrYlUmi0I70BeY16te1Tjxf4rG9dn7a
	u+Y8YTSnQ4nuXsVqDnR+e3vUE+OJR3OboKFIrG7DLaW+9FaWpf3Jo2qnKew+7JulbCuV
	ZvYgrspuUDvke84bZUt0rGomWftAzJzPgfY54hpBvwi4u310JNKvwzJuAOgKQKg0ib9N
	aadPfz0vkCq//xX35OZojZIF/cQVGxFiLsuo+zzNP9DdLYQbUh4etajuEcl7Njo/0DdY
	oeQ9vtuk6VRGqFUbK0SLsZMrFZf8iy5khvBjwVmbv7413XKu0brWNj84hE3e60uMv33H
	OwFA==
MIME-Version: 1.0
X-Received: by 10.236.125.164 with SMTP id z24mr110526yhh.138.1410347848174;
	Wed, 10 Sep 2014 04:17:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Wed, 10 Sep 2014 04:17:27 -0700 (PDT)
In-Reply-To: <CALRGHr-kpOc88VED2YM3ZaS6beSXz_+xujK7UW6PmvO5BwzP2A@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
	<CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
	<CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
	<CAP9ODKp=xaS+WoQe-zKTpcKiqmdk4mHteoZ8a9BqO1w96hcbxg@mail.gmail.com>
	<CALRGHr_OiFeW60BsKxe0XdrBbkcXAE+usv3-=pHnhXCzONK_vg@mail.gmail.com>
	<CAP9ODKoBFp7Pskwch4nLq4mkJOB-uFh1m2w7zz46LZ=CUp5JAg@mail.gmail.com>
	<CALRGHr9iRe3j9j0ce2RnOz7TP+1UzaPqtE5vsooBze_A0fAuyA@mail.gmail.com>
	<CALRGHr98gwgsSQQ9tnLBan-XybFqXN=VoMKYueh5YWhOVXFWXQ@mail.gmail.com>
	<CAP9ODKqbwXrieO8yUJYu6+vBK6qerCCZsamkbz6RO5vS0Wq_oA@mail.gmail.com>
	<CALRGHr-kpOc88VED2YM3ZaS6beSXz_+xujK7UW6PmvO5BwzP2A@mail.gmail.com>
Date: Wed, 10 Sep 2014 08:17:27 -0300
X-Google-Sender-Auth: RBLOh75I8Dt0ibwTJR_WNqpqDF0
Message-ID: <CAP9ODKocrq=t1GHqnVqt=SpfGsMXTr_60_K5GaOspuY6gCgm2g@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Sep 2014 11:17:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 10, 2014 at 1:17 AM, Switesh Fulpagare
<switesh.fulpagare@mindastoneridge.com> wrote:
> Hi Otavio,
>      Please confirm the following that i had understood -
>
> 1. You have pushed the fix.
> 2. Now, i have to apply the patch, with
>
>     SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
> +QT_MODULE_BRANCH = "5.4"
>
>  SRC_URI += " \
>      file://0001-examples.pro-include-server-buffer-only-when-buildin.patch
> \
>
> 3. I need to write
>     SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
>     +QT_MODULE_BRANCH = "5.4"
> in the file,   Home/bin/fsl-community-bsp/sources/meta-qt5//recipes-qt/qt5/
> qtwayland_git.bb
>
> 4. Then apply patch
>     $ patch <
> file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
>
> Are the above steps are right? Please Otavio consider that i m beginner in
> the Linux platform.

Are you using Daisy or master?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

