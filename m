Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M013Z-0000iU-Ry
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 May 2009 00:18:09 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1654234yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2009 15:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IHSUlNG4PYOD88W4cLiYry6WVJZmixwoQUdJKrnhk08=;
	b=nUUtdIBsRZPrA9kq8xMHe3w3NeP8f2FULrjVBUGGpN7F6HnZRfGp31t5jyvFzqV942
	u7bYbngqnW/OxZihWXr13SD4K8GhOFxO6HNZ0t2HxC5Xjqr+qPIyL7OuQ+SmfQ+BEBG2
	41Lc42vfRcdLypOYWfceE5cxjqRlCywytzVHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QVAoZuXZ9Jzr7H+iVRKMNx8uCPiv+7seaUHLq+G16pC3gcuW0h0rkjRK4iCsuL/B2g
	S1sy06ySWhKnmkRHhTXQ8Hz6rORl1S7IYN+ajQZeZBdGuyMaaet6yMRA87EKYv3CZOQx
	M6fzlQqjPRidT5IJ880Jib9SpDX2aT3SudMSg=
MIME-Version: 1.0
Received: by 10.231.35.75 with SMTP id o11mr442127ibd.16.1241215959036; Fri, 
	01 May 2009 15:12:39 -0700 (PDT)
In-Reply-To: <49FB6AB5.6040607@balister.org>
References: <49FAE94F.2090101@doredevelopment.dk>
	<c384c5ea0905011430h57c5165bp6d455fc47ada91@mail.gmail.com>
	<49FB6AB5.6040607@balister.org>
Date: Sat, 2 May 2009 00:12:39 +0200
Message-ID: <c384c5ea0905011512s46ace2e0n917fc049a5b400a9@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFB1bGwgcmVxdWVzdCBmcm9tIERvcsOpRGV2ZWxvcG1lbnQgLSBOZXc6IE1pY3JvIGRpc3Ryby9pbWFnZQ==?=
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
X-List-Received-Date: Fri, 01 May 2009 22:18:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Fri, May 1, 2009 at 11:33 PM, Philip Balister <philip@balister.org> wrote:
> Leon Woestenberg wrote:
>> On Fri, May 1, 2009 at 2:21 PM, Martin Lund <mgl@doredevelopment.dk>
>> I'm not sure what the exact GIT workflow is for such a pull, anyone?
>
> I wouldn't be that hard to submit two patches, one for the distro and
> another for the image.
>
OK, do your thing :-)


I thought a pull neatly remembers the remote history, or links to it,
or <magic here>?
At least that is what I would expect from a distributed version
control system. :)

Regards,
-- 
Leon


