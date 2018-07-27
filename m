Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 26BEF78CDD;
	Fri, 27 Jul 2018 19:58:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6RJw0Ds021631
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Jul 2018 12:58:01 -0700 (PDT)
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 27 Jul 2018 12:58:00 -0700
To: Aditya Tayade <Aditya.Tayade@kpit.com>,
	"openembedded-issues@lists.openembedded.org"
	<openembedded-issues@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <MA1PR01MB053655685322C5FE49975DADEE550@MA1PR01MB0536.INDPRD01.PROD.OUTLOOK.COM>
	<MAXPR01MB034862B6CB3CFEF598A3BA47912A0@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <98805952-f1f9-d24e-03c2-8f58fbc64d1b@windriver.com>
Date: Fri, 27 Jul 2018 15:57:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <MAXPR01MB034862B6CB3CFEF598A3BA47912A0@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
X-Originating-IP: [172.25.44.2]
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [meta-openembedded] Original ltrace_git.bb SRCREV commit used is now unavailable in git tarball from ltrace.org
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
X-List-Received-Date: Fri, 27 Jul 2018 19:58:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/27/2018 06:34 AM, Aditya Tayade wrote:
> Hi,
> 
> 
> Me too facing same issue. Any advice on this.

Archived versions to fix previous releases may be here:
    https://alioth-archive.debian.org/git/collab-maint/

for master, a commit to pull from ltrace.org makes sense
to me but someone who follows debian development might
be able to help locate the git repo. All I found was:
    https://alioth-archive.debian.org/git/collab-maint/
and a maze of twisty little hyperlinks.

Aditya, Nisha,

Will you send a patch? See:
    https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

../Randy


> 
> 
> 
> Regards,
> 
> Aditya Tayade
> 
> ________________________________
> From: Nisha Parrakat
> Sent: Tuesday, July 24, 2018 4:08:12 PM
> To: openembedded-issues@lists.openembedded.org; openembedded-devel@lists.openembedded.org
> Cc: yocto@yoctoproject.org
> Subject: [meta-openembedded] Original ltrace_git.bb SRCREV commit used is now unavailable in git tarball from ltrace.org
> 
> 
> Hi all,
> 
> 
> ltrace recipe is pointing to a fetch url (git://anonscm.debian.org/collab-maint/ltrace.git;branch=master) that is discontinued now.
> 
> No ltrace found in alternate salsa.debian.org.
> 
> Tarball for ltrace is present in ltrace.org but the SRCREV in the mentioned in the original recipe is not found any more but we do see the same commit with another sha but a different git history.
> 
> 
> Please advice if we should modify the SRCREV to reflect the new git source from ltrace.org?
> 
> 
> original SRCREV in recipe c22d3594...
> 
> corresponding SRCREV coming from the git tarball is ea8928da...
> 
> 
> Please advice .
> 
> 
> 
> 
> Regards,
> Ms Nisha Parrakat
> KPIT Technologies Ltd, Pune, INDIA
> 
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
> 


-- 
# Randy MacLeod
# Wind River Linux

