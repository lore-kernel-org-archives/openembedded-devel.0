Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NGUqO-00087h-3Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 10:52:59 +0100
Received: by fxm25 with SMTP id 25so2248457fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 01:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=JQ8O2dYjf26cYrXb/q2lYt1IM8aAirlodooxe0WBj/c=;
	b=WVLqJn3NYhI3UBX9raL93n2byXYBhgNOrVmvTaIE45/bPnA/XBC+UyfWRn9XYt5sem
	WYD1dB1eV6LV0geXBrnV9xlTOl+HO+ci0JlGEDpEhVPLjiCOgjSK90xcaQep8en5RMYv
	wvQ0yAADp6aE3stIxUoO7fw+2eUxR3pRVFUpc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=S3PumBnGGvOPz2BI7CBqZFY78diyUfrGSEv8kJT9QUh8a1n57NvlXruTuerZmEddlE
	6nyi5OG5mo34i0CPy/m9FttGLdISFyev6v7yP9L5647Eclt+PltWir3Sz0zF8Kardjdj
	sq2FsQ4vCQDFb///k3N1kOFiQk7LitkMCJRxE=
MIME-Version: 1.0
Received: by 10.223.144.85 with SMTP id y21mr455677fau.1.1259920279311; Fri, 
	04 Dec 2009 01:51:19 -0800 (PST)
In-Reply-To: <E1NGUiP-00061U-6s@melo.openembedded.org>
References: <E1NGUiP-00061U-6s@melo.openembedded.org>
Date: Fri, 4 Dec 2009 10:51:18 +0100
Message-ID: <141020e30912040151l26670979g9cb02c4d4539da38@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] David-John Willis : font-util: Add 1.1.1 target and native.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Dec 2009 09:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 4, 2009 at 10:44 AM, git version control <
git@git.openembedded.org> wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: a0fb85891d24df07bd140f0b9f277e9ebb3768d7
> URL:
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=a0fb85891d24df07bd140f0b9f277e9ebb3768d7
>
> Author: David-John Willis <John.Willis@Distant-earth.com>
> Date:   Thu Dec  3 09:30:27 2009 +0000
>
> font-util: Add 1.1.1 target and native.
>

http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=martin_jansa/xorg-7.5&id=c465d9fcf16a6e42afc2f984978ddeaacd9568d3


You still probably need this patch.

Would be great to merge it from that branch first, I like INC_PR but now
I'll get lots of conflicts in all font packages and I'll have to update font
recipes in that branch to INC_PR too :/.

BTW: as I don't have all angstrom/OE supported devices to test xorg-7.5
there, I won't merge that branch to oe.dev myself, I need  help from
device/distro maintainers, please...

Regards,


>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>

