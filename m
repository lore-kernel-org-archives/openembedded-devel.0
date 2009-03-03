Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LeXf7-0004yW-QB
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 17:40:10 +0100
Received: by rv-out-0708.google.com with SMTP id b17so3177292rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 08:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Csg1sNWWdoSzHY4WuIpd54/eyy1w4OtJUYmkpr9HJiM=;
	b=soaO+XN1PesMLwLcz9ZrFnnE9QqwnYoBj4Ss9hO5CiTCPImP49SkD6gNQnqBaLI+31
	exG5Hxz1IGm6mvcmlv1BNB+It7PVTVUO2+oa9ZS8qegOof12UdvJqEqSIaMQTxdl33g1
	vCNFwryzPuD1AjAbHOzCCor7g2RntzczLvc38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=edNKBTDJaf1L8xtx2g5/9pG71iRHYj/x5fTd+lEKFfXsCtv4lUED+bkjSUXNtSQar0
	c5r62a7pCii+1+S7eGc9Wt/yfWTOmn7U1Rm9CRBApVa3pG+fu41D6h9w4VBt4uvKlTO6
	zIH3Fj9mTd66UcM6tDvTpXIBaokvb/fi/LWBc=
MIME-Version: 1.0
Received: by 10.140.207.2 with SMTP id e2mr3618513rvg.148.1236098165454; Tue, 
	03 Mar 2009 08:36:05 -0800 (PST)
In-Reply-To: <49A8626B.8020209@balister.org>
References: <f46da1cf0902201818r3fcf3432oc14929b5f455bbe7@mail.gmail.com>
	<f96d234e0902240651r7ad36677h8e828964308e2b50@mail.gmail.com>
	<49A55A59.5080409@balister.org>
	<f96d234e0902250828x6e72a8b6kc0a4285125f27b0e@mail.gmail.com>
	<49A8626B.8020209@balister.org>
Date: Tue, 3 Mar 2009 11:36:05 -0500
Message-ID: <f96d234e0903030836v316ca59eue516322bb3d5eead@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Documentation/User Manual questions
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
X-List-Received-Date: Tue, 03 Mar 2009 16:40:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/2/27 Philip Balister <philip@balister.org>:

> docs.openembedded.org is working now. Koen put a copy of the manual up
> there, but I suspect that long term other documents may also belong there.
> I'm not sure who has access to that part of amethyst/ Cliff, Koen and
> others, can you work out the details of keeping this up to date?

I discussed with Koen -- I'll point a cron job at docs.oe.org, and
keep the html, single page html, and pdf up to date daily.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


