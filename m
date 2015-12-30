Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3006FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 16:51:01 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 77so45647842ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=IyNv5s+d9tFiMv542Gbp6qpLdjSx/P6FAj6SdCFtjD4=;
	b=v/ajCaUeJywTQ7XLvJQjCK9ajMpyw/LgxcpZCmFEtqqhSmf5iNAHaIR4RQRK9budMn
	4E3Wyj+ryGq4lFh8vneUdTV70iJ/oY+Eu15HOwC+2WB1z4/GKw071fhLvsnCHNPj0BcD
	n2Ej43/se0IZRSkr02GtCVBLNhRDcsFwaMNxlRsT8sPaesztpG1omKhOe8oAYfOvLU7Z
	p4yL+sh1oFSHRba+3Ex/P0RFIVojfN3DKyRxrdeTLcsktJivdWZ2gs4pIz36/e/VAbtO
	Z9b/km/56vP0pKWu7CKSmReeBzGKdhlGPxNI4NM5xTnXMkJYQnfU3yjlaihvliDkveJG
	6ZRg==
X-Received: by 10.107.36.83 with SMTP id k80mr73354817iok.140.1451494261920;
	Wed, 30 Dec 2015 08:51:01 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	124sm27186505ioz.10.2015.12.30.08.50.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 08:51:01 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56840B6A.3080001@gmail.com>
Date: Wed, 30 Dec 2015 11:50:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: next bitbake world run and updates
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
X-List-Received-Date: Wed, 30 Dec 2015 16:51:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Martin,

I'm hoping my nodejs_4.2.3.bb makes it into your next "State of bitbake
world" run and passes this time. When do you think your next "bitbake
world" will occur? I ask because since sending my v4 patches for
nodejs_4.2.3, node-v4.2.4 has been released.

Do I send the list a patch of the delta between 4.2.3 and 4.2.4? Or do I
update my entire patchset and send a v5?

Best regards,
    Trevor

