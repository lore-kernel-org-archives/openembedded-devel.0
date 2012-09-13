Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TC9MQ-0005AC-8z
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 15:21:38 +0200
Received: by pbcwy7 with SMTP id wy7so3724396pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 06:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=XA21Myvdw2UEvxiZNBZO049Wp8dZVhgMtDWT8yjVkBQ=;
	b=IDHBmbGhK3qAp5eOxryi2dzNJlt3dRT28rJbZr8VM0SclkxSfvgmcMrbs5KE9z1W2y
	DWg5+4qIcJkIgOD74D47smVDFKPM7n5DiZMCtCCDJBnlPxYtYVy46H3InUuwoie53v5x
	EsegA07+5J24MTH/pwbk9LbqISOwyElDGmnprX0fd0n82FUDAUB6XBnN0VvL4NfvU2UU
	TKmNXY3fQkTEVBJ1+xVxsbsI2Smyl1wyFSX6fUQSj889/DXeDVtNjg+TMEIlWLy8XVNw
	Uqbm1vNswz5sr6wn4Um2U2HECX/7wFUk/bw/xolqT2amUqO9RtUMBX7iFSdXejiYQnAO
	jrVg==
MIME-Version: 1.0
Received: by 10.68.135.67 with SMTP id pq3mr4771919pbb.49.1347541352119; Thu,
	13 Sep 2012 06:02:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Thu, 13 Sep 2012 06:02:32 -0700 (PDT)
In-Reply-To: <1347521638-3093-1-git-send-email-b28495@freescale.com>
References: <1347521638-3093-1-git-send-email-b28495@freescale.com>
Date: Thu, 13 Sep 2012 10:02:32 -0300
X-Google-Sender-Auth: Yl0wVxyaqfqA5O_rD2WSXSZUA0U
Message-ID: <CAP9ODKqsEUDmG5OcoxtXd2Jn-H0wu6EiWNC8ckpUxfipGZtt-g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: b29882@freescale.com
Subject: Re: [meta-oe][for-denzil][PATCH] systemd.bbclass: use system variables instead of hardcoded paths
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
X-List-Received-Date: Thu, 13 Sep 2012 13:21:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 13, 2012 at 4:33 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>
>
> Fix below issue when check service-files for 64bit target:
> | DEBUG: adding systemd calls to postinst/postrm for busybox-syslog-systemd
> | ERROR: Function failed:
> |
> | For package busybox-syslog-systemd SYSTEMD_SERVICE-entry busybox-syslog.service does not exist
> NOTE: package busybox-1.19.4-r6+fsl.0: task do_package: Failed
>
> Signed-off-by: Ting Liu <b28495@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


