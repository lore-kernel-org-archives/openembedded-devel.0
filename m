Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Q7uOo-0006PX-Mn
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 20:57:46 +0200
Received: by bwz5 with SMTP id 5so2365487bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 11:55:38 -0700 (PDT)
Received: by 10.204.45.164 with SMTP id e36mr1143597bkf.29.1302202538304; Thu,
	07 Apr 2011 11:55:38 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.204.102.139 with HTTP; Thu, 7 Apr 2011 11:55:18 -0700 (PDT)
X-Originating-IP: [95.29.102.200]
In-Reply-To: <4D9E04ED.4000102@gumstix.com>
References: <4D9E04ED.4000102@gumstix.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Thu, 7 Apr 2011 22:55:18 +0400
X-Google-Sender-Auth: QHr4NoQk9z3dWIp1Ok_Pt-kIpNs
Message-ID: <BANLkTikHnQ3HFfJ2RjasA20Z-8uOwM0F6w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Portmap Install Permissions
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
X-List-Received-Date: Thu, 07 Apr 2011 18:57:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/4/7 Neil MacMunn <neil@gumstix.com>:
> I recently switched to angstrom-2010.x and now I'm running into what appears
> to be a permissions issue.

This is issue in bitbake master. Please use bitbake 1.12 as workaround for now.

-- 
Yury Bushmelev


