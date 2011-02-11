Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PnxEk-0006K8-TR
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 18:56:55 +0100
Received: by qyk8 with SMTP id 8so3238902qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 09:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=daHVvTXdMCx+rcOdkVi9Mzl8Yn9azwuyYDItsM2jx2U=;
	b=siHLsuhdxEKC+Iv+bfIu0CfBa7NiVMFvhHsK1Sz/UznwSdurUFS5lvAH/iuNVCNe4k
	YD8FzCCnB6bZdq1uD1F/vx8LLtIcgbYUXFr24BsAi/ngN4ocHDlBsfjCMGm2r62i5kYO
	H30xtYYLq7vglGZX0kzaG0ur2vRWS5+g7Dvvk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hk/zrDxsgf/TWnfkkFdEGH8FD3gfYH1H/ljqFisepT2CPlCjdNqJ9Wd8Cek4pIp/UB
	5y6Lehs1jen4AEvtgnY8JDHN6BwbArNCfPa9RGeDFOMwFF0Y3VfrnyGttDy9fdHElHfB
	kOXFDRfWSz6wBhIfZc2zY4chn3VA5kXsOsUak=
MIME-Version: 1.0
Received: by 10.229.6.207 with SMTP id a15mr823109qca.298.1297446948168; Fri,
	11 Feb 2011 09:55:48 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Fri, 11 Feb 2011 09:55:48 -0800 (PST)
In-Reply-To: <4D554A28.5040201@mentor.com>
References: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTinrY3g2RLOnHWZ-sborNsFjET8-uE_OoU-LQ2Hf@mail.gmail.com>
	<4D554A28.5040201@mentor.com>
Date: Fri, 11 Feb 2011 18:55:48 +0100
Message-ID: <AANLkTike=O5Kf-RHYCVGr9tOy_8EbCDFx+z0WQ73tWXY@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] base-files: update fstab for jornada7xx
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
X-List-Received-Date: Fri, 11 Feb 2011 17:56:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ah thanks, must have missed it somehow :).

bye,
Filip Zyzniewski

On 2/11/11, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/11/2011 06:44 AM, Filip Zyzniewski wrote:
>> On 2/9/11, Filip Zyzniewski<filip.zyzniewski@gmail.com>  wrote:
>>> We use the scsi subsystem for PCMCIA ATA access, so device files are
>>> /dev/sda*, not /dev/hda*.
>>> See recipes/linux/linux-jlime-jornada7xx-2.6.34+git/defconf_jlime:702.
>>>
>>> Signed-off-by: Filip Zyzniewski<filip.zyzniewski@gmail.com>
>>
>> Is there a reason for this patch to be absent from
>> http://patches.openembedded.org ?
>>
>> Should I add it there by hand?
>
> They're absent since I applied this and archived it back on the 9th :)
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


