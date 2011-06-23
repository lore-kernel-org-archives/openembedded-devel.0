Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QZfKc-0006ia-Ce
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 10:32:10 +0200
Received: by fxm19 with SMTP id 19so1289257fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=d5WZEpkFYkYtLuwHANiAAe/lITezfF+w74nRMN7Ndaw=;
	b=MeD37XbY9YVRXNhQR7hqMr+zXFn08WuLXruWY5UPUYlwbirMxAri4F8KYi2gl11/07
	tPcP0cMowXH7i9+E2DC0PaRmfYPEvCJxkE6pyG7B4dOYsNISqD0zD24eSQZUagdl9dqm
	4Q/H/VQ3ywYDN6wbS1tiDSyAogF2cRR0iBd7g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=errG+INJ6nYNJkV876t+y+slWUpzPI8Yg8lZ4J8Xb2HFfI8jXaubkEK0NOPdpTl9FB
	+kWsZFl3Xq7aAXyMMsLi9V9SkbBlanuf8Q7/yUUg2gdWXimbW3vZTV6vpaKx/TpquCKc
	fB8ODEsEMU/fFRCyxc8vOROnWEz8z94ct3YBE=
Received: by 10.223.75.138 with SMTP id y10mr2291180faj.36.1308817715353;
	Thu, 23 Jun 2011 01:28:35 -0700 (PDT)
Received: from guibc (vig38-2-81-56-113-2.fbx.proxad.net [81.56.113.2])
	by mx.google.com with ESMTPS id n15sm824647fag.42.2011.06.23.01.28.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 01:28:34 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Thu, 23 Jun 2011 10:28:30 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110623102830.6075f466@guibc>
In-Reply-To: <4E01FF0B.5050604@gmail.com>
References: <guillaume.beraudo@belledonne-communications.com>
	<1308128541-5714-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<20110622131659.4399ce87@guibc> <4E01FF0B.5050604@gmail.com>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH v3] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Thu, 23 Jun 2011 08:32:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > What is the process for getting this patch merged?
>
> send pull request for meta-oe
> 

Sorry for this stupid question, but how to do it?

Is there a better documentation than 
http://www.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded ?



